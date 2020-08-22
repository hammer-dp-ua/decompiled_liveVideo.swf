package common.logic.handler.AVStream
{
   import common.logic.command.AVStream.VideoStreamRequestCommand;
   import common.logic.command.AVStream.VideoStreamResponseCommand;
   import common.logic.command.Response;
   import common.logic.command.ResponseCommand;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   import common.service.SNSocket.DeviceInfoEx;
   import flash.utils.ByteArray;
   
   public class VideoStreamRequestCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_iStreamId:int;
      
      private var m_iCameraId:int;
      
      private var m_strConnectAddr:String;
      
      private var m_strStreamName:String;
      
      private var m_bIsReceive:Boolean;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      private var m_objObjectList:Vector.<Object>;
      
      public function VideoStreamRequestCommandHandler(param1:TCPTransfer, param2:DeviceInfoEx, param3:int, param4:int)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_objDeviceInfoEx = param2;
         this.m_iCameraId = param3;
         this.m_iStreamId = param4;
         this.m_bIsReceive = false;
         this.m_objFunctionList = new Vector.<Function>();
         this.m_objObjectList = new Vector.<Object>();
      }
      
      public function handleCommand(param1:Buffer) : int
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:Function = null;
         var _loc2_:int = this.parseCommand(param1);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         if(this.isInvokeFlag())
         {
            _loc3_ = 0;
            while(_loc3_ < this.m_objFunctionList.length)
            {
               _loc4_ = this.m_objObjectList.pop();
               _loc5_ = this.m_objFunctionList.pop();
               _loc5_.call(_loc4_,this.m_strConnectAddr,this.m_strStreamName);
               _loc3_++;
            }
         }
         this.m_objTCPTransfer.close();
         return GeneralError.SN_SUCCESS;
      }
      
      public function isReceiveFlag() : Boolean
      {
         return this.m_bIsReceive;
      }
      
      public function setReceiveFlag(param1:Boolean) : void
      {
         this.m_bIsReceive = param1;
      }
      
      public function setTCPTransfer(param1:TCPTransfer) : void
      {
         this.m_objTCPTransfer = param1;
      }
      
      private function parseCommand(param1:Buffer) : int
      {
         var _loc7_:ResponseCommand = null;
         var _loc8_:Response = null;
         var _loc9_:int = 0;
         var _loc10_:VideoStreamRequestCommand = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc2_:VideoStreamResponseCommand = new VideoStreamResponseCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            _loc7_ = new ResponseCommand();
            _loc3_ = _loc7_.parseCommand(param1);
            if(GeneralError.SN_SUCCESS != _loc3_)
            {
               return _loc3_;
            }
            _loc8_ = _loc7_.getResponse();
            _loc9_ = _loc8_.RequestId;
            _loc10_ = new VideoStreamRequestCommand();
            if(_loc9_ != _loc10_.getCommondId())
            {
               return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
            }
            _loc11_ = _loc8_.SucceedFlag;
            if(_loc11_ == Response.SUCCESSFLAG_ERROR)
            {
               _loc12_ = _loc8_.ErrorNo;
               return _loc12_;
            }
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         this.m_objTCPTransfer.ConsumerId = _loc2_.ConsumerId;
         _loc2_.getAVStreamParam();
         var _loc4_:ByteArray = _loc2_.getStreamAddr().getIP();
         _loc4_.position = 0;
         var _loc5_:String = _loc4_.readMultiByte(_loc4_.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_GB);
         var _loc6_:int = _loc5_.indexOf("@");
         if(_loc6_ == -1)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         this.m_strConnectAddr = "rtmp://" + _loc5_.substr(0,_loc6_);
         this.m_strStreamName = _loc5_.substr(_loc6_ + 1,_loc5_.length - 1);
         return GeneralError.SN_SUCCESS;
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         var _loc2_:int = 0;
         var _loc3_:VideoStreamRequestCommand = new VideoStreamRequestCommand();
         _loc3_.StreamId = this.m_iStreamId;
         _loc3_.setDestId(this.m_objDeviceInfoEx.DeviceID,this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
         _loc3_.Mode = VideoStreamRequestCommand.FLASH_MOD;
         _loc3_.CameraId = this.m_iCameraId;
         _loc3_.DataChannelId = param1;
         var _loc4_:Buffer = new Buffer();
         _loc2_ = _loc3_.getCommand(_loc4_);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         _loc2_ = this.m_objTCPTransfer.sendCommand(_loc4_);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function setInvokeFlag(param1:Boolean) : void
      {
         this.m_bInvokeFlag = param1;
      }
      
      public function isInvokeFlag() : Boolean
      {
         return this.m_bInvokeFlag;
      }
      
      public function pushInvokeObject(param1:Object) : void
      {
         this.m_objObjectList.push(param1);
      }
      
      public function pushInvokeFunction(param1:Function) : void
      {
         this.m_objFunctionList.push(param1);
      }
   }
}
