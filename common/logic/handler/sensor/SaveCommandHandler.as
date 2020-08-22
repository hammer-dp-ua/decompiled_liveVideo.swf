package common.logic.handler.sensor
{
   import common.logic.command.Response;
   import common.logic.command.ResponseCommand;
   import common.logic.command.sensor.SensorConfigureCommand;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.logic.sensor.consts.SensorUIData;
   import common.sdk.sensor.RemoteSensorUI;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   
   public class SaveCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_bIsReceive:Boolean;
      
      private var m_objRemoteSensorUI:RemoteSensorUI;
      
      private var m_strParameter:String;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      private var m_objObjectList:Vector.<Object>;
      
      private var m_fun:Function;
      
      public function SaveCommandHandler(param1:TCPTransfer, param2:String)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_strParameter = param2;
         this.m_objFunctionList = new Vector.<Function>();
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         if(!SensorUIData.m_bSupportFlag)
         {
            return SNError.SN_ERROR_DEVICE_NOT_SUPPORT;
         }
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         _loc2_.SubCommandId = SensorConfigureCommand.SAVE_PARAMETES_REQUEST;
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
         var _loc8_:int = 0;
         var _loc2_:ResponseCommand = new ResponseCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         var _loc4_:Response = _loc2_.getResponse();
         var _loc5_:int = _loc4_.RequestId;
         var _loc6_:SensorConfigureCommand = new SensorConfigureCommand();
         if(_loc5_ != _loc6_.getCommondId())
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc7_:int = _loc4_.SucceedFlag;
         if(_loc7_ == Response.SUCCESSFLAG_ERROR)
         {
            _loc8_ = _loc4_.ErrorNo;
            return _loc8_;
         }
         if(this.isInvokeFlag())
         {
            if(this.m_objFunctionList.length > 0)
            {
               this.m_fun = this.m_objFunctionList[0];
               this.m_fun.call(null,this.m_strParameter);
            }
         }
         while(this.m_objTCPTransfer.getErrorHandlerListLength() > 0)
         {
            this.m_objTCPTransfer.popErrorRealCommandHandler();
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
