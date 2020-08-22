package common.logic.handler.AVStream
{
   import common.logic.command.AVStream.ChangeAVStreamCommand;
   import common.logic.command.AVStream.VideoStreamResponseCommand;
   import common.logic.command.Response;
   import common.logic.command.ResponseCommand;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   
   public class ChangeAVStreamCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_iCameraId:int;
      
      private var m_iStreamId:int;
      
      private var m_iConsumerId:int;
      
      private var m_bIsReceive:Boolean;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      public function ChangeAVStreamCommandHandler(param1:TCPTransfer)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_iCameraId = 0;
         this.m_iStreamId = 0;
         this.m_iConsumerId = 0;
         this.m_bIsReceive = false;
         this.m_bInvokeFlag = false;
         this.m_objFunctionList = new Vector.<Function>();
      }
      
      public function setTCPTransfer(param1:TCPTransfer) : void
      {
         this.m_objTCPTransfer = param1;
      }
      
      public function set CameraId(param1:int) : void
      {
         this.m_iCameraId = param1;
      }
      
      public function get CameraId() : int
      {
         return this.m_iCameraId;
      }
      
      public function set StreamId(param1:int) : void
      {
         this.m_iStreamId = param1;
      }
      
      public function get StreamId() : int
      {
         return this.m_iStreamId;
      }
      
      public function set ConsumerId(param1:int) : void
      {
         this.m_iConsumerId = param1;
      }
      
      public function get ConsumerId() : int
      {
         return this.m_iConsumerId;
      }
      
      public function isReceiveFlag() : Boolean
      {
         return this.m_bIsReceive;
      }
      
      public function setReceiveFlag(param1:Boolean) : void
      {
         this.m_bIsReceive = param1;
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         var _loc2_:ChangeAVStreamCommand = new ChangeAVStreamCommand();
         _loc2_.ConsumerId = this.m_iConsumerId;
         _loc2_.StreamId = this.m_iStreamId;
         _loc2_.CameraId = this.m_iCameraId;
         var _loc3_:Buffer = new Buffer();
         var _loc4_:int = _loc2_.getCommand(_loc3_);
         if(_loc4_ != GeneralError.SN_SUCCESS)
         {
            return _loc4_;
         }
         _loc4_ = this.m_objTCPTransfer.sendCommand(_loc3_);
         if(_loc4_ != GeneralError.SN_SUCCESS)
         {
            return _loc4_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function handleCommand(param1:Buffer) : int
      {
         var _loc3_:Function = null;
         var _loc2_:int = this.parseCommand(param1);
         if(this.m_bInvokeFlag)
         {
            if(this.m_objFunctionList.length > 0)
            {
               _loc3_ = this.m_objFunctionList.pop();
               if(_loc3_ != null)
               {
                  _loc3_.call(null,_loc2_);
               }
            }
         }
         this.m_objTCPTransfer.close();
         return GeneralError.SN_SUCCESS;
      }
      
      private function parseCommand(param1:Buffer) : int
      {
         var _loc4_:ResponseCommand = null;
         var _loc5_:Response = null;
         var _loc6_:int = 0;
         var _loc7_:ChangeAVStreamCommand = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:VideoStreamResponseCommand = new VideoStreamResponseCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            _loc4_ = new ResponseCommand();
            _loc3_ = _loc4_.parseCommand(param1);
            if(GeneralError.SN_SUCCESS != _loc3_)
            {
               return _loc3_;
            }
            _loc5_ = _loc4_.getResponse();
            _loc6_ = _loc5_.RequestId;
            _loc7_ = new ChangeAVStreamCommand();
            if(_loc6_ != _loc7_.getCommondId())
            {
               return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
            }
            _loc8_ = _loc5_.SucceedFlag;
            if(_loc8_ == Response.SUCCESSFLAG_ERROR)
            {
               _loc9_ = _loc5_.ErrorNo;
               return _loc9_;
            }
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
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
      }
      
      public function pushInvokeFunction(param1:Function) : void
      {
         this.m_objFunctionList.push(param1);
      }
   }
}
