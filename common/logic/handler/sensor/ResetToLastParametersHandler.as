package common.logic.handler.sensor
{
   import common.logic.command.Response;
   import common.logic.command.ResponseCommand;
   import common.logic.command.sensor.SensorConfigureCommand;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   
   public class ResetToLastParametersHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_bIsReceive:Boolean;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      private var m_objObjectList:Vector.<Object>;
      
      public function ResetToLastParametersHandler(param1:TCPTransfer)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_bIsReceive = false;
         this.m_bInvokeFlag = false;
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         _loc2_.SubCommandId = SensorConfigureCommand.RESET_TO_LAST_PARAMETERS_REQUEST;
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
         var _loc9_:int = 0;
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         _loc2_.SubCommandId = SensorConfigureCommand.RESET_TO_LAST_PARAMETERS_REQUEST;
         var _loc3_:ResponseCommand = new ResponseCommand();
         var _loc4_:int = _loc3_.parseCommand(param1);
         if(_loc4_ != GeneralError.SN_SUCCESS)
         {
            return _loc4_;
         }
         var _loc5_:Response = _loc3_.getResponse();
         var _loc6_:int = _loc5_.RequestId;
         if(_loc6_ != _loc2_.SubCommandId)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc7_:int = _loc5_.SucceedFlag;
         if(_loc7_ == Response.SUCCESSFLAG_ERROR)
         {
            _loc9_ = _loc5_.ErrorNo;
            return _loc9_;
         }
         var _loc8_:ICommandHandler = null;
         if(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
         {
            _loc8_ = this.m_objTCPTransfer.popCommandHandler();
            _loc8_.setTCPTransfer(this.m_objTCPTransfer);
            _loc8_.sendCommand();
            if(_loc8_.isReceiveFlag())
            {
               this.m_objTCPTransfer.pushCommandHandler(_loc8_);
            }
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
      
      public function isInvokeFlag() : Boolean
      {
         return this.m_bInvokeFlag;
      }
      
      public function setInvokeFlag(param1:Boolean) : void
      {
         this.m_bInvokeFlag = param1;
      }
      
      public function pushInvokeObject(param1:Object) : void
      {
      }
      
      public function pushInvokeFunction(param1:Function) : void
      {
      }
      
      public function setTCPTransfer(param1:TCPTransfer) : void
      {
         this.m_objTCPTransfer = param1;
      }
   }
}
