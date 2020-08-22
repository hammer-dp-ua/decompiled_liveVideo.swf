package common.logic.handler.ptz
{
   import common.logic.command.ptz.PTZOperationCommand;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   import common.service.SNSocket.DeviceInfoEx;
   
   public class PTZCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_bIsReceive:Boolean;
      
      private var m_strPTZOperation:String;
      
      private var m_iCameraId:int;
      
      public function PTZCommandHandler(param1:TCPTransfer, param2:String, param3:int)
      {
         super();
         this.m_strPTZOperation = param2;
         this.m_objTCPTransfer = param1;
         this.m_bIsReceive = false;
         this.m_iCameraId = param3;
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         var _loc2_:PTZOperationCommand = new PTZOperationCommand();
         _loc2_.CameraId = this.m_iCameraId;
         _loc2_.PTZOperation = this.m_strPTZOperation;
         var _loc3_:Buffer = new Buffer();
         _loc2_.getCommand(_loc3_);
         _loc3_.getByBuffer().position = 0;
         this.m_objTCPTransfer.sendCommand(_loc3_);
         return 0;
      }
      
      public function handleCommand(param1:Buffer) : int
      {
         return 0;
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
      
      public function setInvokeFlag(param1:Boolean) : void
      {
      }
      
      public function isInvokeFlag() : Boolean
      {
         return false;
      }
      
      public function pushInvokeObject(param1:Object) : void
      {
      }
      
      public function pushInvokeFunction(param1:Function) : void
      {
      }
   }
}
