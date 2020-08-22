package common.logic.handler
{
   import common.logic.command.CommandConst;
   import common.logic.command.Response;
   import common.logic.command.ResponseCommand;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   import common.service.SNSocket.DeviceInfoEx;
   
   public class LogoutCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_objSecuritySession:SecuritySession;
      
      private var m_bIsReceive:Boolean;
      
      public function LogoutCommandHandler(param1:TCPTransfer, param2:DeviceInfoEx, param3:SecuritySession)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_objDeviceInfoEx = param2;
         this.m_objSecuritySession = param3;
         this.m_bIsReceive = false;
      }
      
      public function sendCommand(param1:int = 8855) : int
      {
         var _loc2_:int = this.m_objSecuritySession.logout(param1);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
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
      
      public function handleCommand(param1:Buffer) : int
      {
         var _loc2_:int = this.parseCommand(param1);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         var _loc3_:ICommandHandler = null;
         if(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
         {
            _loc3_ = this.m_objTCPTransfer.popCommandHandler();
            _loc3_.setTCPTransfer(this.m_objTCPTransfer);
            _loc3_.sendCommand();
            if(_loc3_.isReceiveFlag())
            {
               this.m_objTCPTransfer.pushCommandHandler(_loc3_);
            }
         }
         else
         {
            this.m_objTCPTransfer.close();
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function parseCommand(param1:Buffer) : int
      {
         var _loc7_:int = 0;
         var _loc2_:ResponseCommand = new ResponseCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         var _loc4_:Response = _loc2_.getResponse();
         var _loc5_:int = _loc4_.RequestId;
         if(_loc5_ != CommandConst.CONST_COMMANDID_LOGOUT)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc6_:int = _loc4_.SucceedFlag;
         if(_loc6_ == Response.SUCCESSFLAG_ERROR)
         {
            _loc7_ = _loc4_.ErrorNo;
            return _loc7_;
         }
         return GeneralError.SN_SUCCESS;
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
