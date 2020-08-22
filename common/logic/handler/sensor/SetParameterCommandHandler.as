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
   
   public class SetParameterCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_bIsReceive:Boolean;
      
      private var m_strParameter:String;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      private var m_objObjectList:Vector.<Object>;
      
      private var m_bPerComandFlag:Boolean;
      
      public function SetParameterCommandHandler(param1:TCPTransfer, param2:String, param3:Boolean)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_strParameter = param2;
         this.m_objFunctionList = new Vector.<Function>();
         this.m_objObjectList = new Vector.<Object>();
         this.m_bPerComandFlag = param3;
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         _loc2_.SubCommandId = SensorConfigureCommand.SET_PARAMETES_REQUEST;
         _loc2_.SubCommandBody = this.m_strParameter;
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
         var _loc10_:Function = null;
         var _loc2_:ResponseCommand = new ResponseCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         var _loc4_:Response = _loc2_.getResponse();
         var _loc5_:SensorConfigureCommand = new SensorConfigureCommand();
         var _loc6_:int = _loc4_.RequestId;
         if(_loc6_ != _loc5_.getCommondId())
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc7_:int = _loc4_.SucceedFlag;
         if(_loc7_ == Response.SUCCESSFLAG_ERROR)
         {
            _loc9_ = _loc4_.ErrorNo;
            return _loc9_;
         }
         if(this.m_bInvokeFlag)
         {
            _loc10_ = this.m_objFunctionList.pop();
            _loc10_.call(null);
         }
         if(!this.m_bPerComandFlag)
         {
            while(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
            {
               this.m_objTCPTransfer.popCommandHandler();
            }
            while(this.m_objTCPTransfer.getErrorHandlerListLength() > 0)
            {
               this.m_objTCPTransfer.popErrorRealCommandHandler();
            }
            return GeneralError.SN_SUCCESS;
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
      
      public function setTCPTransfer(param1:TCPTransfer) : void
      {
         this.m_objTCPTransfer = param1;
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
