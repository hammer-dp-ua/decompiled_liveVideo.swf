package common.sdk.sensor
{
   import common.logic.handler.LoginCommandHandler;
   import common.logic.handler.SecuritySession;
   import common.logic.handler.sensor.AllParameterCommandHandler;
   import common.logic.handler.sensor.CreateSensorErrorHandler;
   import common.logic.handler.sensor.RealTimeErrorCommandHandler;
   import common.logic.handler.sensor.ResetErrorHandler;
   import common.logic.handler.sensor.ResetToLastParametersHandler;
   import common.logic.handler.sensor.RestoreFactoryErrorHandler;
   import common.logic.handler.sensor.RetSetParameterCommandHandler;
   import common.logic.handler.sensor.SaveCommandHandler;
   import common.logic.handler.sensor.SensorSupportFlagCommandHandler;
   import common.logic.handler.sensor.SetParameterCommandHandler;
   import common.logic.handler.sensor.UICommonConfigCommandHandler;
   import common.logic.handler.sensor.UILanguageCommandHandler;
   import common.logic.handler.sensor.UIStyleConfigCommandHandler;
   import common.logic.includes.GeneralError;
   import common.logic.sensor.consts.SensorUIData;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.IErrorHandler;
   import common.service.Communication.TCPTransfer;
   import common.service.SNSocket.DeviceInfoEx;
   
   public class RemoteSensorControl
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      public function RemoteSensorControl(param1:DeviceInfoEx)
      {
         super();
         this.m_objTCPTransfer = new TCPTransfer();
         this.m_objDeviceInfoEx = param1;
      }
      
      public function closeTCPTransfer() : void
      {
         this.m_objTCPTransfer.close();
      }
      
      public function create(param1:int, param2:Function, param3:Function) : int
      {
         this.m_objTCPTransfer.open();
         this.m_objTCPTransfer.connect(this.m_objDeviceInfoEx.getDeviceAddr());
         this.m_objTCPTransfer.setIsRealError(true);
         this.m_objTCPTransfer.setDestId(this.m_objDeviceInfoEx.DeviceID,this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
         SensorUIData.m_iLanguage = param1;
         var _loc4_:SecuritySession = new SecuritySession(this.m_objTCPTransfer, this.m_objDeviceInfoEx);
         var _loc5_:ICommandHandler = new LoginCommandHandler(this.m_objTCPTransfer, this.m_objDeviceInfoEx,_loc4_);
         _loc5_.setReceiveFlag(true);
         var _loc6_:ICommandHandler = new SensorSupportFlagCommandHandler(this.m_objTCPTransfer);
         _loc6_.setReceiveFlag(true);
         var _loc7_:ICommandHandler = new UIStyleConfigCommandHandler(this.m_objTCPTransfer);
         _loc7_.setReceiveFlag(true);
         var _loc8_:ICommandHandler = new UICommonConfigCommandHandler(this.m_objTCPTransfer,param1);
         _loc8_.setReceiveFlag(true);
         var _loc9_:ICommandHandler = new UILanguageCommandHandler(this.m_objTCPTransfer,param1);
         _loc9_.setReceiveFlag(true);
         var _loc10_:ICommandHandler = new AllParameterCommandHandler(this.m_objTCPTransfer);
         _loc10_.setReceiveFlag(true);
         _loc10_.setInvokeFlag(true);
         _loc10_.pushInvokeFunction(param2);
         var _loc11_:IErrorHandler = new CreateSensorErrorHandler(this.m_objTCPTransfer);
         _loc11_.setInvokeFlag(true);
         _loc11_.pushInvokeFunction(param3);
         this.m_objTCPTransfer.pushErrorRealCommandHandler(_loc11_);
         this.m_objTCPTransfer.setSecuritySession(_loc4_);
         this.m_objTCPTransfer.pushCommandHandler(_loc10_);
         this.m_objTCPTransfer.pushCommandHandler(_loc9_);
         this.m_objTCPTransfer.pushCommandHandler(_loc8_);
         this.m_objTCPTransfer.pushCommandHandler(_loc7_);
         this.m_objTCPTransfer.pushCommandHandler(_loc6_);
         this.m_objTCPTransfer.pushCommandHandler(_loc5_);
         return GeneralError.SN_SUCCESS;
      }
      
      public function getUIStyleConfigString(param1:Function) : void
      {
         this.m_objTCPTransfer.open();
         this.m_objTCPTransfer.connect(this.m_objDeviceInfoEx.getDeviceAddr());
         this.m_objTCPTransfer.setDestId(this.m_objDeviceInfoEx.DeviceID,this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
         var _loc2_:SecuritySession = new SecuritySession(this.m_objTCPTransfer,this.m_objDeviceInfoEx);
         var _loc3_:ICommandHandler = new LoginCommandHandler(this.m_objTCPTransfer,this.m_objDeviceInfoEx,_loc2_);
         _loc3_.setReceiveFlag(true);
         var _loc4_:ICommandHandler = new SensorSupportFlagCommandHandler(this.m_objTCPTransfer);
         _loc4_.setReceiveFlag(true);
         _loc4_.setInvokeFlag(true);
         _loc4_.pushInvokeFunction(param1);
         var _loc5_:ICommandHandler = new UIStyleConfigCommandHandler(this.m_objTCPTransfer);
         _loc5_.setReceiveFlag(true);
         this.m_objTCPTransfer.setIsRealError(true);
         this.m_objTCPTransfer.setSecuritySession(_loc2_);
         this.m_objTCPTransfer.pushCommandHandler(_loc5_);
         this.m_objTCPTransfer.pushCommandHandler(_loc4_);
         this.m_objTCPTransfer.pushCommandHandler(_loc3_);
      }
      
      public function save(param1:Function, param2:Function, param3:String) : int
      {
         var _loc4_:ICommandHandler = new SetParameterCommandHandler(this.m_objTCPTransfer,param3,true);
         _loc4_.setReceiveFlag(true);
         var _loc5_:ICommandHandler = new SaveCommandHandler(this.m_objTCPTransfer,param3);
         _loc5_.setReceiveFlag(true);
         _loc5_.setInvokeFlag(true);
         _loc5_.pushInvokeFunction(param1);
         var _loc6_:IErrorHandler = new RestoreFactoryErrorHandler(this.m_objTCPTransfer);
         this.m_objTCPTransfer.setIsRealError(true);
         _loc6_.setInvokeFlag(true);
         _loc6_.pushInvokeFunction(param2);
         this.m_objTCPTransfer.pushErrorRealCommandHandler(_loc6_);
         this.m_objTCPTransfer.pushCommandHandler(_loc5_);
         this.m_objTCPTransfer.pushCommandHandler(_loc4_);
         _loc4_.sendCommand();
         return GeneralError.SN_SUCCESS;
      }
      
      public function realTimeUpdate(param1:String, param2:String, param3:Function) : int
      {
         var _loc4_:ICommandHandler = new SetParameterCommandHandler(this.m_objTCPTransfer,param1,true);
         _loc4_.setReceiveFlag(true);
         var _loc5_:IErrorHandler = new RealTimeErrorCommandHandler(this.m_objTCPTransfer,param2);
         this.m_objTCPTransfer.setIsRealError(true);
         _loc5_.setInvokeFlag(true);
         _loc5_.pushInvokeFunction(param3);
         this.m_objTCPTransfer.pushErrorRealCommandHandler(_loc5_);
         this.m_objTCPTransfer.pushCommandHandler(_loc4_);
         _loc4_.sendCommand();
         return GeneralError.SN_SUCCESS;
      }
      
      public function getAllParameter(param1:Function) : int
      {
         var _loc2_:ICommandHandler = new AllParameterCommandHandler(this.m_objTCPTransfer);
         _loc2_.setReceiveFlag(true);
         _loc2_.setInvokeFlag(true);
         _loc2_.pushInvokeFunction(param1);
         this.m_objTCPTransfer.pushCommandHandler(_loc2_);
         return _loc2_.sendCommand();
      }
      
      public function restore(param1:Function) : int
      {
         var _loc2_:ICommandHandler = new RetSetParameterCommandHandler(this.m_objTCPTransfer);
         _loc2_.setReceiveFlag(true);
         var _loc3_:ICommandHandler = new AllParameterCommandHandler(this.m_objTCPTransfer);
         _loc3_.setReceiveFlag(true);
         _loc3_.setInvokeFlag(true);
         _loc3_.pushInvokeFunction(param1);
         var _loc4_:IErrorHandler = new RestoreFactoryErrorHandler(this.m_objTCPTransfer);
         this.m_objTCPTransfer.setIsRealError(true);
         _loc4_.setInvokeFlag(true);
         _loc4_.pushInvokeFunction(param1);
         this.m_objTCPTransfer.pushErrorRealCommandHandler(_loc4_);
         this.m_objTCPTransfer.pushCommandHandler(_loc3_);
         this.m_objTCPTransfer.pushCommandHandler(_loc2_);
         _loc2_.sendCommand();
         return GeneralError.SN_SUCCESS;
      }
      
      public function reset(param1:Function, param2:Function, param3:String) : int
      {
         var _loc4_:ICommandHandler = new SetParameterCommandHandler(this.m_objTCPTransfer,param3,false);
         _loc4_.setReceiveFlag(true);
         _loc4_.setInvokeFlag(true);
         _loc4_.pushInvokeFunction(param1);
         this.m_objTCPTransfer.setIsRealError(true);
         var _loc5_:IErrorHandler = new ResetErrorHandler(this.m_objTCPTransfer);
         _loc5_.setInvokeFlag(true);
         _loc5_.pushInvokeFunction(param2);
         var _loc6_:ICommandHandler = new AllParameterCommandHandler(this.m_objTCPTransfer);
         _loc6_.setReceiveFlag(false);
         _loc6_.setInvokeFlag(true);
         _loc6_.pushInvokeFunction(param2);
         this.m_objTCPTransfer.pushCommandHandler(_loc6_);
         this.m_objTCPTransfer.pushCommandHandler(_loc4_);
         this.m_objTCPTransfer.pushErrorRealCommandHandler(_loc5_);
         _loc4_.sendCommand();
         return GeneralError.SN_SUCCESS;
      }
      
      public function resetWithoutRefreshUI() : int
      {
         var _loc1_:ICommandHandler = new ResetToLastParametersHandler(this.m_objTCPTransfer);
         _loc1_.setReceiveFlag(true);
         _loc1_.sendCommand();
         return GeneralError.SN_SUCCESS;
      }
   }
}
