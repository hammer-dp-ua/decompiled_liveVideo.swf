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
   
   public class LoginCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_objSecuritySession:SecuritySession;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_bIsReceive:Boolean;
      
      public function LoginCommandHandler(param1:TCPTransfer, param2:DeviceInfoEx, param3:SecuritySession)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_objDeviceInfoEx = param2;
         this.m_objSecuritySession = param3;
         this.m_bIsReceive = false;
      }
      
      public function sendCommand(param1:int = 8855) : int
      {
         var _loc2_:int = this.m_objSecuritySession.login(param1);
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
         var _loc3_:ICommandHandler = null;
         var _loc2_:int = this.parseCommand(param1);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         if(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
         {
            _loc3_ = this.m_objTCPTransfer.popCommandHandler();
            _loc2_ = _loc3_.sendCommand(-1);
            if(_loc2_ != GeneralError.SN_SUCCESS)
            {
               return _loc2_;
            }
            if(_loc3_.isReceiveFlag())
            {
               this.m_objTCPTransfer.pushCommandHandler(_loc3_);
            }
            else if(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
            {
               _loc3_ = this.m_objTCPTransfer.popCommandHandler();
               _loc2_ = _loc3_.sendCommand(-1);
               this.m_objTCPTransfer.pushCommandHandler(_loc3_);
            }
         }
         else
         {
            this.m_objTCPTransfer.close();
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function parseCommand(responseBuffer:Buffer) : int
      {
         var responseCommand:ResponseCommand = new ResponseCommand();
         
         var parseCommandStatus:int = responseCommand.parseCommand(responseBuffer);
         if(parseCommandStatus != GeneralError.SN_SUCCESS)
         {
            return parseCommandStatus;
         }
         
         var response:Response = responseCommand.getResponse();
         var requestId:int = response.RequestId;
         if(requestId != CommandConst.CONST_COMMANDID_LOGIN)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         
         var succeedFlag:int = response.SucceedFlag;
         if(succeedFlag == Response.SUCCESSFLAG_ERROR)
         {
            return response.ErrorNo;
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
