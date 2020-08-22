package common.sdk.ptz
{
   import common.logic.command.PTZComandConst;
   import common.logic.command.ptz.PTZOperationCommand;
   import common.logic.handler.LoginCommandHandler;
   import common.logic.handler.SecuritySession;
   import common.logic.handler.ptz.PTZCommandHandler;
   import common.logic.includes.GeneralError;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   import common.service.SNSocket.DeviceInfoEx;
   
   public class RemotePTZOperation
   {
       
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_iSpeedValue:int;
      
      private var m_iCameraId:int;
      
      private var m_objTCPTransfer:TCPTransfer;
      
      public function RemotePTZOperation(param1:DeviceInfoEx = null, param2:int = 1)
      {
         super();
         this.m_iSpeedValue = 63;
         this.m_iCameraId = param2;
         this.m_objTCPTransfer = new TCPTransfer();
         this.m_objTCPTransfer.open();
         this.m_objTCPTransfer.setSocketCloseFun(this.reconnect);
         this.m_objDeviceInfoEx = param1;
      }
      
      public function reconnect() : void
      {
         this.m_objTCPTransfer = new TCPTransfer();
         this.m_objTCPTransfer.open();
         this.m_objTCPTransfer.setSocketCloseFun(this.reconnect);
         this.openTransfer();
      }
      
      public function openTransfer() : void
      {
         if(null == this.m_objDeviceInfoEx)
         {
            return;
         }
         this.m_objTCPTransfer.open();
         this.m_objTCPTransfer.connect(this.m_objDeviceInfoEx.getDeviceAddr());
         this.m_objTCPTransfer.setDestId(this.m_objDeviceInfoEx.DeviceID,this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
      }
      
      public function isConnected() : Boolean
      {
         if(this.m_objTCPTransfer.isConnected())
         {
            return true;
         }
         return false;
      }
      
      public function stop() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_STOP + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function rotateUp() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_UP + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function set CameraId(param1:int) : void
      {
         this.m_iCameraId = param1;
      }
      
      public function rotateDown() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_DOWN + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function doMiddle() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_STOP + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function rotateLeft() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_LEFT + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function rotateRight() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_RIGHT + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function rotateRightUp() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_RIGHTUP + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function rotateLeftUp() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_LEFTUP + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function rotateRightDown() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_RIGHTDOWN + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function rotateLeftDown() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ROTATE_LEFTDOWN + "," + this.m_iSpeedValue + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function focusFar() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_FOCUS_FAR + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function focusNear() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_FOCUS_NEAR + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function irisIncrease() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_IRIS_INCREASE + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function irisDecrease() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_IRIS_DECREASE + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function presetSet(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_PRESET_SET + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function presetInvoke(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_PRESET_INVOKE + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function presetRemove(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_PRESET_REMOVE + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function traceSet(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TRACE_SET + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function traceInvoke(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TRACE_INVOKE + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function runAutoStudy(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_RUN_AUTO_STUDY + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function setAutoStudyStartPoint(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_START_AUTO_STUDY + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function setAutoStudyEndPoint(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_END_AUTO_STUDY + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function traceRemove(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TRACE_REMOVE + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function scan(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_SCAN + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function scanSetStartPoint(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_SCAN_SET_STARTPOINT + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function scanSetStopPoint(param1:int) : String
      {
         var _loc2_:* = null;
         if(param1 == 0)
         {
            _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_PRESET_INVOKE + "," + 93 + ")";
         }
         else
         {
            _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_SCAN_SET_STOPPOINT + "," + param1 + ")";
         }
         return this.sendPTZOperation(_loc2_);
      }
      
      public function scanRemove(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_SCAN_REMOVE + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function SetTourStartPoint(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TOUR_SET_STARTPOINT + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function SetTourStopPoint(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TOUR_SET_ENDPOINT + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function AddTourPresetPoint(param1:int, param2:int, param3:int) : String
      {
         var _loc4_:* = null;
         _loc4_ = "(" + PTZComandConst.OPERATE_TYPE_TOUR_ADD_PRESETPOINT + "," + param1 + "," + param2 + "," + param3 + ")";
         return this.sendPTZOperation(_loc4_);
      }
      
      public function TourInvoke(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TOUR_RUN + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function StopTour(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TOUR_STOP + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function DeleteTour(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_TOUR_DELETE + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function idleSet(param1:int, param2:int, param3:int) : String
      {
         var _loc4_:* = null;
         _loc4_ = "(" + PTZComandConst.OPERATE_TYPE_KEEPER_SET + "," + param1 + "," + param2 + "," + param3 + ")";
         return this.sendPTZOperation(_loc4_);
      }
      
      public function idleRun(param1:int) : String
      {
         var _loc2_:* = null;
         _loc2_ = "(" + PTZComandConst.OPERATE_TYPE_KEEPER_RUN + "," + param1 + ")";
         return this.sendPTZOperation(_loc2_);
      }
      
      public function runBrush() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_RUN_BRUSH + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function stopBrush() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_STOP_BRUSH + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function openLight() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_OPEN_LIGHT + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function closeLight() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_CLOSE_LIGHT + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function controlRedLight(param1:int, param2:int, param3:int, param4:int) : String
      {
         var _loc5_:* = null;
         _loc5_ = "(" + PTZComandConst.OPERATE_TYPE_INFRARED_CTRL + "," + param1 + "," + param2 + "," + param3 + "," + param4 + ")";
         return this.sendPTZOperation(_loc5_);
      }
      
      public function zoomIn() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ZOOM_IN + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function zoomOut() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_ZOOM_OUT + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function setPTZPosition() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_SET_PTZ_POSTION + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function setPTZNorthPosition() : String
      {
         var _loc1_:* = null;
         _loc1_ = "(" + PTZComandConst.OPERATE_TYPE_SET_PTZ_NORTH_POSTION + ")";
         return this.sendPTZOperation(_loc1_);
      }
      
      public function threeDimensionalPositioning(param1:int, param2:int, param3:int) : String
      {
         var _loc4_:int = param1;
         var _loc5_:int = param2;
         var _loc6_:int = param3;
         if(_loc4_ > 100)
         {
            _loc4_ = 100;
         }
         if(_loc4_ < -100)
         {
            _loc4_ = -100;
         }
         if(_loc5_ > 100)
         {
            _loc5_ = 100;
         }
         if(_loc5_ < -100)
         {
            _loc5_ = -100;
         }
         if(_loc6_ > 127)
         {
            _loc6_ = 127;
         }
         if(_loc6_ < -127)
         {
            _loc6_ = -127;
         }
         var _loc7_:* = "(" + PTZComandConst.OPERATE_TYPE_THREE_DIMENSIONAL_ORIENTATION + "," + _loc4_ + "," + _loc5_ + "," + _loc6_ + ")";
         return this.sendPTZOperation(_loc7_);
      }
      
      public function set SpeedValue(param1:int) : void
      {
         this.m_iSpeedValue = param1;
      }
      
      public function get SpeedValue() : int
      {
         return this.m_iSpeedValue;
      }
      
      private function sendPTZOperation(param1:String) : String
      {
         var objPTZOperationCommand:PTZOperationCommand = null;
         var objCommandBuffer:Buffer = null;
         var objSecuritySession:SecuritySession = null;
         var objLoginICommandHandler:LoginCommandHandler = null;
         var nRet:int = 0;
         var p_sPTZOperation:String = param1;
         try
         {
            objPTZOperationCommand = new PTZOperationCommand();
            objPTZOperationCommand.CameraId = this.m_iCameraId;
            objPTZOperationCommand.PTZOperation = p_sPTZOperation;
            objCommandBuffer = new Buffer();
            objPTZOperationCommand.getCommand(objCommandBuffer);
            objCommandBuffer.getByBuffer().position = 0;
            this.m_objTCPTransfer.setIsRealError(true);
            this.m_objTCPTransfer.setDestId(this.m_objDeviceInfoEx.DeviceID,this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
            objSecuritySession = new SecuritySession(this.m_objTCPTransfer,this.m_objDeviceInfoEx);
            objLoginICommandHandler = new LoginCommandHandler(this.m_objTCPTransfer,this.m_objDeviceInfoEx,objSecuritySession);
            objLoginICommandHandler.setReceiveFlag(true);
            this.m_objTCPTransfer.setSecuritySession(objSecuritySession);
            objLoginICommandHandler.sendCommand();
            nRet = this.m_objTCPTransfer.sendCommand(objCommandBuffer);
         }
         catch(err:Error)
         {
            return err.message;
         }
         return "SUCCESS: " + GeneralError.SN_SUCCESS;
      }
      
      public function controlPTZ(param1:String) : int
      {
         this.openTransfer();
         this.m_objDeviceInfoEx.DeviceID.position = 0;
         this.m_objTCPTransfer.setIsRealError(true);
         var _loc2_:PTZCommandHandler = new PTZCommandHandler(this.m_objTCPTransfer,param1,this.m_iCameraId);
         _loc2_.setReceiveFlag(true);
         var _loc3_:ICommandHandler = _loc2_;
         var _loc4_:SecuritySession = new SecuritySession(this.m_objTCPTransfer,this.m_objDeviceInfoEx);
         var _loc5_:ICommandHandler = new LoginCommandHandler(this.m_objTCPTransfer,this.m_objDeviceInfoEx,_loc4_);
         _loc5_.setReceiveFlag(true);
         this.m_objTCPTransfer.setSecuritySession(_loc4_);
         this.m_objTCPTransfer.pushCommandHandler(_loc3_);
         this.m_objTCPTransfer.pushCommandHandler(_loc5_);
         return GeneralError.SN_SUCCESS;
      }
   }
}
