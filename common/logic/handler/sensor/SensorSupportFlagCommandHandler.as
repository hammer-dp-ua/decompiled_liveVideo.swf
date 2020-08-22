package common.logic.handler.sensor
{
   import common.logic.command.sensor.SensorConfigureCommand;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.logic.sensor.consts.SensorUIData;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   
   public class SensorSupportFlagCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_bIsReceive:Boolean;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      public function SensorSupportFlagCommandHandler(param1:TCPTransfer)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_objFunctionList = new Vector.<Function>();
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         _loc2_.SubCommandId = SensorConfigureCommand.GET_SENSOR_STATUS_REQUEST;
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
         var _loc9_:Function = null;
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         if(SensorConfigureCommand.GET_SENSOR_STATUS_RESPONSE != _loc2_.SubCommandId)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc4_:int = _loc2_.ResultCode;
         if(_loc4_ != GeneralError.SN_SUCCESS)
         {
            return _loc4_;
         }
         var _loc5_:String = _loc2_.SubCommandBody;
         var _loc6_:int = int(_loc5_);
         if(_loc6_ != GeneralError.SN_SUCCESS)
         {
            SensorUIData.m_bSupportFlag = false;
         }
         else
         {
            SensorUIData.m_bSupportFlag = true;
         }
         SensorUIData.m_bIsOpen = true;
         if(this.isInvokeFlag())
         {
            _loc8_ = 0;
            while(_loc8_ < this.m_objFunctionList.length)
            {
               _loc9_ = this.m_objFunctionList.pop();
               _loc9_.call(null,GeneralError.SN_SUCCESS);
               _loc8_++;
            }
         }
         var _loc7_:ICommandHandler = null;
         if(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
         {
            _loc7_ = this.m_objTCPTransfer.popCommandHandler();
            _loc7_.setTCPTransfer(this.m_objTCPTransfer);
            _loc3_ = _loc7_.sendCommand();
            if(_loc3_ != GeneralError.SN_SUCCESS)
            {
               return _loc3_;
            }
            if(_loc7_.isReceiveFlag())
            {
               this.m_objTCPTransfer.pushCommandHandler(_loc7_);
            }
         }
         else
         {
            this.m_objTCPTransfer.close();
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
      
      public function pushInvokeObject(param1:Object) : void
      {
      }
      
      public function setInvokeFlag(param1:Boolean) : void
      {
         this.m_bInvokeFlag = param1;
      }
      
      public function isInvokeFlag() : Boolean
      {
         return this.m_bInvokeFlag;
      }
      
      public function pushInvokeFunction(param1:Function) : void
      {
         this.m_objFunctionList.push(param1);
      }
   }
}
