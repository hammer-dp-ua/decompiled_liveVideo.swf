package common.service.Communication
{
   import common.logic.command.CommandHead;
   import common.logic.handler.LogoutCommandHandler;
   import common.logic.handler.SecuritySession;
   import common.logic.includes.GeneralError;
   import common.logic.includes.NetworkIOError;
   import common.logic.share.CommonConst;
   import common.service.SNSocket.InetAddr;
   import common.service.SNSocket.TCPSocket;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.utils.ByteArray;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class TCPTransfer
   {
       
      
      private var m_objTCPSocket:TCPSocket;
      
      private var m_bAlreadyReceiveHead:Boolean;
      
      private var m_objPacketHead:PacketHead;
      
      private var m_iSessionId:int;
      
      private var m_iConsumerId:int;
      
      private var m_bCompressFlag:Boolean;
      
      private var m_bEncryptFlag:Boolean;
      
      private var m_iIPProtoVer:int;
      
      private var m_objCommandHandlerList:Vector.<ICommandHandler>;
      
      private var m_objErrorHandlerList:Vector.<IErrorHandler>;
      
      private var m_objSecuritySession:SecuritySession;
      
      private var m_iErrorCode:int;
      
      private var m_bIsRealError:Boolean;
      
      private var m_objSocketCloseFun:Function;
      
      private var m_byDestId:ByteArray;
      
      private var m_nReceiveTimeout:Number;
      
      private var m_iReceiveTimeoutId:int;
      
      public function TCPTransfer()
      {
         super();
         this.m_objTCPSocket = new TCPSocket();
         this.m_objCommandHandlerList = new Vector.<ICommandHandler>();
         this.m_objErrorHandlerList = new Vector.<IErrorHandler>();
         this.m_objPacketHead = new PacketHead();
         this.m_iErrorCode = 0;
         this.m_bIsRealError = false;
         this.m_byDestId = new ByteArray();
         this.m_byDestId.length = CommonConst.CONST_LENGTH_COMMAND_DESTID;
         this.m_objSecuritySession = null;
         this.m_nReceiveTimeout = 0;
         this.m_iReceiveTimeoutId = 0;
      }
      
      public function setSocketCloseFun(param1:Function) : void
      {
         this.m_objSocketCloseFun = param1;
      }
      
      public function setSecuritySession(param1:SecuritySession) : void
      {
         this.m_objSecuritySession = param1;
      }
      
      public function pushCommandHandler(param1:ICommandHandler) : void
      {
         this.m_objCommandHandlerList.push(param1);
      }
      
      public function popCommandHandler() : ICommandHandler
      {
         return this.m_objCommandHandlerList.pop();
      }
      
      public function pushErrorRealCommandHandler(param1:IErrorHandler) : void
      {
         this.m_objErrorHandlerList.push(param1);
      }
      
      public function popErrorRealCommandHandler() : IErrorHandler
      {
         return this.m_objErrorHandlerList.pop();
      }
      
      public function isConnected() : Boolean
      {
         return this.m_objTCPSocket.connected;
      }
      
      public function open() : void
      {
         this.m_objTCPSocket.open();
         this.m_objTCPSocket.addEventListener(IOErrorEvent.IO_ERROR,this.socketFailHandler);
         this.m_objTCPSocket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         this.m_objTCPSocket.addEventListener(Event.CONNECT,this.connectHandler);
         this.m_objTCPSocket.addEventListener(ProgressEvent.SOCKET_DATA,this.receiveDataHandler,false,1000);
         this.m_objTCPSocket.addEventListener(Event.CLOSE,this.closeHandler);
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         this.ErrorCode = -1;
      }
      
      private function socketFailHandler(param1:IOErrorEvent) : void
      {
         this.ErrorCode = NetworkIOError.SN_ERROR_NETWORKIO_CONNECT_FAILED;
      }
      
      private function closeHandler(param1:Event) : void
      {
         if(this.m_objSocketCloseFun != null)
         {
            this.m_objSocketCloseFun();
         }
      }
      
      private function connectHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ICommandHandler = null;
         var _loc4_:int = 0;
         if(this.m_objCommandHandlerList.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.m_objCommandHandlerList.length)
            {
               _loc3_ = this.m_objCommandHandlerList.pop();
               _loc4_ = _loc3_.sendCommand();
               if(_loc3_.isReceiveFlag())
               {
                  this.m_objCommandHandlerList.push(_loc3_);
                  break;
               }
               _loc2_++;
            }
         }
      }
      
      public function close() : void
      {
         var _loc1_:ICommandHandler = null;
         if(this.m_objTCPSocket.connected)
         {
            if(null != this.m_objSecuritySession)
            {
               _loc1_ = new LogoutCommandHandler(this,null,this.m_objSecuritySession);
               _loc1_.sendCommand();
            }
            this.m_objTCPSocket.close();
         }
      }
      
      private function getFlag() : Boolean
      {
         return this.m_objTCPSocket.Flag;
      }
      
      public function connect(param1:InetAddr) : void
      {
         var _loc2_:ByteArray = param1.getIP();
         _loc2_.position = 0;
         this.m_objTCPSocket.connectTo(_loc2_.readMultiByte(_loc2_.length,CommonConst.SOCKET_DATA_ENCODE_GB),param1.Port);
      }
      
      public function set SessionId(param1:int) : void
      {
         this.m_iSessionId = param1;
      }
      
      public function get SessionId() : int
      {
         return this.m_iSessionId;
      }
      
      public function set ConsumerId(param1:int) : void
      {
         this.m_iConsumerId = param1;
      }
      
      public function get ConsumerId() : int
      {
         return this.m_iConsumerId;
      }
      
      public function set ErrorCode(param1:int) : void
      {
         this.m_iErrorCode = param1;
      }
      
      public function get ErrorCode() : int
      {
         return this.m_iErrorCode;
      }
      
      public function setDestId(param1:ByteArray, param2:int) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = param2 > CommonConst.CONST_LENGTH_COMMAND_DESTID?int(CommonConst.CONST_LENGTH_COMMAND_DESTID):int(param2);
         this.m_byDestId.writeBytes(param1,0,_loc3_);
         this.m_byDestId.length = CommonConst.CONST_LENGTH_COMMAND_DESTID;
         this.m_byDestId.position = 0;
         return true;
      }
      
      public function sendCommand(bufferParam:Buffer) : int
      {
         var paramByteArray:ByteArray = bufferParam.getData();
         paramByteArray.position = 0;
         var paramDataLength:int = bufferParam.getDataLength();
         var packet:Packet = new Packet();
         packet.setCompressFlag(false);
         
         packet.setSessionId(this.m_iSessionId);
         paramByteArray.position = 37;
         paramByteArray.writeBytes(this.m_byDestId, 0, this.m_byDestId.bytesAvailable);
         paramByteArray.position = 0;
         this.m_byDestId.position = 0;
         
         var statusOk:Boolean = packet.setPayload(paramByteArray, paramDataLength);
         if(!statusOk)
         {
            return NetworkIOError.SN_ERROR_PACKET_CREATE_FAILED;
         }
         
         var packetBuffer:Buffer = new Buffer();
         var packetStatus:int = packet.getPacket(packetBuffer);
         if(packetStatus != GeneralError.SN_SUCCESS)
         {
            return packetStatus;
         }
         
         statusOk = this.m_objTCPSocket.sendData(packetBuffer.getData());
         if(!statusOk)
         {
            return NetworkIOError.SN_ERROR_NETWORKIO_CONNECT_FAILED;
         }
         
         this.m_objTCPSocket.readMultiByte(this.m_objTCPSocket.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_GB);
         if(this.m_objCommandHandlerList.length > 0)
         {
            if(this.m_objCommandHandlerList[this.m_objCommandHandlerList.length - 1].isReceiveFlag())
            {
               this.removeTimoutInterval();
               this.m_iReceiveTimeoutId = setInterval(this.checkReceiveTimeout,1000);
            }
         }
         var date:Date = new Date();
         this.m_nReceiveTimeout = date.time;
         return GeneralError.SN_SUCCESS;
      }
      
      private function removeTimoutInterval() : void
      {
         if(this.m_iReceiveTimeoutId > 0)
         {
            clearInterval(this.m_iReceiveTimeoutId);
            this.m_iReceiveTimeoutId = 0;
         }
      }
      
      private function checkReceiveTimeout() : void
      {
         var _loc1_:Date = new Date();
         if(this.m_nReceiveTimeout != 0 && _loc1_.time - this.m_nReceiveTimeout > 10 * 1000)
         {
            if(this.m_iErrorCode >= 0)
            {
               this.m_iErrorCode = NetworkIOError.SN_ERROR_NETWORKIO_ACCEPT_TIMEOUT;
               this.close();
            }
         }
         if(this.m_iErrorCode < 0)
         {
            this.removeTimoutInterval();
            this.m_nReceiveTimeout = 0;
         }
      }
      
      public function receiveCommand(param1:Buffer, param2:InetAddr) : int
      {
         if(!this.m_bAlreadyReceiveHead)
         {
            this.receivePacketHead();
            this.m_bAlreadyReceiveHead = true;
         }
         this.m_iSessionId = this.m_objPacketHead.SessionId;
         var _loc3_:int = this.m_objPacketHead.PayloadLength;
         if(_loc3_ < 0)
         {
            return NetworkIOError.SN_ERROR_PACKET_HEAD_PARSE_ERROR;
         }
         if(_loc3_ > this.m_objTCPSocket.bytesAvailable)
         {
            return NetworkIOError.SN_ERROR_RECEIVE_NO_FINISH;
         }
         var _loc4_:Boolean = param1.alloc(_loc3_);
         if(!_loc4_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         this.recvPacketPayload(param1);
         this.m_bAlreadyReceiveHead = false;
         return GeneralError.SN_SUCCESS;
      }
      
      public function receivePacketHead() : int
      {
         var _loc1_:ByteArray = new ByteArray();
         if(this.m_objTCPSocket.Flag)
         {
            this.m_objTCPSocket.readBytes(_loc1_,0,CommonConst.CONST_LENGTH_PACKET_HEAD);
            _loc1_.position = 0;
            var _loc2_:int = this.m_objPacketHead.parsePacketHead(_loc1_,CommonConst.CONST_LENGTH_PACKET_HEAD);
            if(_loc2_ != GeneralError.SN_SUCCESS)
            {
               return _loc2_;
            }
            this.m_objTCPSocket.Flag = false;
            return GeneralError.SN_SUCCESS;
         }
         return NetworkIOError.SN_ERROR_NETWORKIO_RECEIVE_FAILED;
      }
      
      public function recvPacketPayload(param1:Buffer) : void
      {
         this.m_objTCPSocket.readBytes(param1.getBuffer(),0,param1.getBufferSize());
         param1.getBuffer().position = 0;
         param1.setDataLength(param1.getBufferSize());
      }
      
      private function receiveDataHandler(param1:ProgressEvent) : void
      {
         this.removeTimoutInterval();
         var _loc2_:int = this.realCommand();
         if(_loc2_ != GeneralError.SN_SUCCESS && this.m_bIsRealError)
         {
            this.errorReal();
         }
         else if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            this.close();
         }
      }
      
      private function realCommand() : int
      {
         var _loc1_:Buffer = null;
         var _loc2_:InetAddr = null;
         var _loc3_:int = 0;
         var _loc4_:CommandHead = null;
         var _loc5_:int = 0;
         var _loc6_:ICommandHandler = null;
         if(this.m_objTCPSocket.bytesAvailable > 0)
         {
            if(this.m_objCommandHandlerList.length == 0)
            {
               return 0;
            }
            this.m_objTCPSocket.Flag = true;
            _loc1_ = new Buffer();
            _loc2_ = new InetAddr();
            _loc3_ = this.receiveCommand(_loc1_,_loc2_);
            if(_loc3_ != GeneralError.SN_SUCCESS)
            {
               if(NetworkIOError.SN_ERROR_RECEIVE_NO_FINISH == _loc3_)
               {
                  return GeneralError.SN_SUCCESS;
               }
               this.m_iErrorCode = _loc3_;
               return _loc3_;
            }
            _loc4_ = new CommandHead();
            _loc5_ = 0;
            _loc3_ = _loc4_.parseCommandHead(_loc1_);
            if(_loc3_ == GeneralError.SN_SUCCESS)
            {
               _loc5_ = _loc4_.CommandId;
               _loc6_ = this.popCommandHandler();
               _loc3_ = _loc6_.handleCommand(_loc1_);
               if(_loc3_ != GeneralError.SN_SUCCESS)
               {
                  this.m_iErrorCode = _loc3_;
                  return _loc3_;
               }
            }
            else
            {
               this.m_iErrorCode = _loc3_;
               return _loc3_;
            }
         }
         return GeneralError.SN_SUCCESS;
      }
      
      private function errorReal() : void
      {
         var _loc1_:* = null;
         var _loc2_:IErrorHandler = null;
         for(_loc1_ in this.m_objErrorHandlerList)
         {
            _loc2_ = this.m_objErrorHandlerList.pop();
            _loc2_.process_ErrorHanlder();
         }
         this.close();
      }
      
      public function setIsRealError(param1:Boolean) : void
      {
         this.m_bIsRealError = param1;
      }
      
      public function getCommandHandlerListLength() : int
      {
         return this.m_objCommandHandlerList.length;
      }
      
      public function clearCommandList() : void
      {
         this.m_objCommandHandlerList.splice(0,this.m_objCommandHandlerList.length);
      }
      
      public function getErrorHandlerListLength() : int
      {
         return this.m_objErrorHandlerList.length;
      }
   }
}
