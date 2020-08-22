package common.logic.handler.sensor
{
   import common.logic.command.sensor.SensorConfigureCommand;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.logic.sensor.consts.SensorUIData;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   import common.service.util.DataConvert;
   import flash.utils.ByteArray;
   
   public class UILanguageCommandHandler implements ICommandHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_bIsReceive:Boolean;
      
      private var m_iLanguageId:int;
      
      public function UILanguageCommandHandler(param1:TCPTransfer, param2:int)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_iLanguageId = param2;
      }
      
      public function sendCommand(param1:int = 0) : int
      {
         if(!SensorUIData.m_bSupportFlag)
         {
            return SNError.SN_ERROR_DEVICE_NOT_SUPPORT;
         }
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         _loc2_.SubCommandId = SensorConfigureCommand.GET_UI_LANGUAGE_CONFIG_REQUEST;
         var _loc3_:ByteArray = new ByteArray();
         DataConvert.convert(this.m_iLanguageId,_loc3_);
         _loc3_.position = 0;
         _loc2_.SubCommandBody = _loc3_.readMultiByte(_loc3_.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_GB);
         var _loc4_:Buffer = new Buffer();
         var _loc5_:int = _loc2_.getCommand(_loc4_);
         if(_loc5_ != GeneralError.SN_SUCCESS)
         {
            return _loc5_;
         }
         _loc5_ = this.m_objTCPTransfer.sendCommand(_loc4_);
         if(_loc5_ != GeneralError.SN_SUCCESS)
         {
            return _loc5_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function handleCommand(param1:Buffer) : int
      {
         var _loc2_:SensorConfigureCommand = new SensorConfigureCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         if(SensorConfigureCommand.GET_UI_INIT_CONFIG_RESPONSE != _loc2_.SubCommandId)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc4_:int = _loc2_.ResultCode;
         if(_loc4_ != GeneralError.SN_SUCCESS)
         {
            return _loc4_;
         }
         var _loc5_:String = _loc2_.SubCommandBody;
         var _loc6_:int = int(_loc5_.length);
         if(1024 * 1024 < _loc6_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         SensorUIData.m_strUILanguage = _loc5_;
         var _loc7_:ICommandHandler = null;
         if(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
         {
            _loc7_ = this.m_objTCPTransfer.popCommandHandler();
            _loc7_.setTCPTransfer(this.m_objTCPTransfer);
            _loc7_.sendCommand();
            if(_loc7_.isReceiveFlag())
            {
               this.m_objTCPTransfer.pushCommandHandler(_loc7_);
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
