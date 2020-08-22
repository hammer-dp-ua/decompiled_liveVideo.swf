package common.sdk
{
   import common.logic.command.PTZComandConst;
   import common.logic.component.DisplaySprite;
   import common.logic.includes.GeneralError;
   import common.logic.includes.NetworkIOError;
   import common.logic.sensor.consts.SensorUIData;
   import common.logic.sensor.util.SensorTool;
   import common.logic.share.CommonConst;
   import common.logic.video.FlashVideoPlayer;
   import common.sdk.player.BlindRegion;
   import common.sdk.player.RemoteCamera;
   import common.sdk.ptz.RemotePTZOperation;
   import common.sdk.sensor.RemoteSensorUI;
   import common.service.SNSocket.DeviceInfoEx;
   import flash.display.BitmapData;
   import flash.display.CapsStyle;
   import flash.display.LineScaleMode;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.display.StageScaleMode;
   import flash.events.ContextMenuEvent;
   import flash.events.FullScreenEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.ui.MouseCursorData;
   import flash.utils.Timer;
   import flash.utils.clearInterval;
   import flash.utils.clearTimeout;
   import flash.utils.setInterval;
   import flash.utils.setTimeout;
   import mx.core.UIComponent;
   import spark.components.BorderContainer;
   import spark.components.Label;
   import spark.components.supportClasses.GroupBase;
   import spark.core.SpriteVisualElement;
   
   public class PlayerUI extends GroupBase
   {
       
      
      private var _objLanguageXMLManager:LanguageXMLManager;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_objMenuSprite:DisplaySprite;
      
      private var m_objBlindRegion:BlindRegion;
      
      private var m_objFlashVideoPlayer:FlashVideoPlayer;
      
      private var m_iLanguageId:int;
      
      private var m_bPressFlag:Boolean;
      
      private var m_iScreenHeight:Number;
      
      private var m_iScreenWidth:Number;
      
      private var m_iSourceHeight:Number;
      
      private var m_iSourceWidth:Number;
      
      private var m_iWidth:Number;
      
      private var m_iHeight:Number;
      
      private var m_nSensorWidth:Number;
      
      private var m_nSensorHeight:Number;
      
      private var m_objZoomSprite:SpriteVisualElement;
      
      private var m_iCount:int;
      
      private var m_bThreeDimensionalPositionFlag:Boolean;
      
      private var m_bIsFullScreen:Boolean;
      
      private var m_iCameraId:uint;
      
      private var m_iCurrentStreamId:int;
      
      private var m_bIsZoom:Boolean;
      
      private var m_bIsLargeZoom:Boolean;
      
      private var m_iVideoUseType:int;
      
      private var m_iColorFlag:int;
      
      private var m_objRightClickMenu:ContextMenu;
      
      private var m_objVideoAreaRect:Rectangle = null;
      
      private var m_objRemotePTZOperation:RemotePTZOperation = null;
      
      private var m_bSensorCloseFlag:Boolean;
      
      private var cursorData:MouseCursorData = null;
      
      private var m_objMainUI:UIComponent;
      
      private var m_objLanguageXMLManager:LanguageXMLManager;
      
      private var m_objRemoteSensorUI:RemoteSensorUI;
      
      private var m_funCreateRemoeteSensorUI:Function;
      
      private var m_nCurrentZoomPicWidth:Number;
      
      private var m_nCurrentZoomPicHeight:Number;
      
      private var m_objZoomRect:Rectangle;
      
      private var m_objClass:Class;
      
      private var m_objRemoteCamera:RemoteCamera;
      
      private var m_iPressX:Number;
      
      private var m_iPressY:Number;
      
      private var m_iPressMoveWidth:Number;
      
      private var m_iPressMoveHeight:Number;
      
      private var m_objScreen:Screen;
      
      private var m_objTipLab:Label;
      
      private var m_bVideoConnectionSuccessful:Boolean;
      
      private var m_objCheckVideoConnectTimer:Timer;
      
      private var m_bVideoTotalNum:Boolean;
      
      private var m_iReconnectVideoId:int;
      
      private var m_bRemoveVideoFlag:Boolean;
      
      private var m_bNoVideoDataFlag:Boolean;
      
      private var m_nCurrentTime:Number;
      
      private var m_iHasVideoDataIntervalId:uint;
      
      private var m_iResetVideoTimeoutId:uint;
      
      private var m_nBufferSize:Number;
      
      private var m_bSameBufferSize:Boolean;
      
      private var m_bShowBufferFlag:Boolean = false;
      
      private var m_objTopBar:BorderContainer;
      
      private var m_objBufferLabel:Label;
      
      private var m_uCount:uint;
      
      public function PlayerUI(param1:DeviceInfoEx, param2:Screen, param3:UIComponent, param4:LanguageXMLManager, param5:int, param6:int)
      {
         super();
         this.m_objDeviceInfoEx = param1;
         this.m_objMainUI = param3;
         this.clipAndEnableScrolling = true;
         this.m_objScreen = param2;
         this.m_objLanguageXMLManager = param4;
         this.m_iScreenWidth = param5;
         this.m_iScreenHeight = param6;
         this.m_objBlindRegion = null;
         this.m_objRemoteSensorUI = null;
         this.m_objTipLab = null;
         this.m_nSensorHeight = 0;
         this.m_nSensorWidth = 0;
         this.m_iCurrentStreamId = 1;
         this.m_bNoVideoDataFlag = false;
         this.m_iHasVideoDataIntervalId = 0;
         this.m_iResetVideoTimeoutId = 0;
         this.m_objCheckVideoConnectTimer = new Timer(3000,0);
         this.m_uCount = 0;
         this.m_nBufferSize = 0;
         this.m_bSameBufferSize = false;
      }
      
      public static function resetDisplayRect(param1:int, param2:int, param3:Rectangle, param4:Rectangle) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc5_:Number = 3 / 4;
         if(param1 != 0)
         {
            _loc5_ = param2 * 1 / (param1 * 1);
         }
         var _loc6_:int = param3.width;
         var _loc7_:int = param3.height;
         if(_loc7_ * 1 / (_loc6_ * 1) >= _loc5_)
         {
            _loc10_ = _loc6_ / _loc5_;
            _loc9_ = param3.y + (_loc7_ - _loc10_) / 2;
            _loc7_ = _loc10_;
            _loc8_ = param3.x;
         }
         else
         {
            _loc11_ = _loc7_ / _loc5_;
            _loc8_ = param3.x + (_loc6_ - _loc11_) / 2;
            _loc6_ = _loc11_;
            _loc9_ = param3.y;
         }
         param4.x = _loc8_;
         param4.width = _loc6_;
         param4.y = _loc9_;
         param4.height = _loc7_;
      }
      
      public function setLanguageId(param1:int) : void
      {
         this.m_iLanguageId = param1;
      }
      
      public function setVideoUseType(param1:int) : void
      {
         this.m_iVideoUseType = param1;
      }
      
      public function setCreateRomoteSensorUIFun(param1:Function) : void
      {
         this.m_funCreateRemoeteSensorUI = param1;
      }
      
      public function setBlindRegion(param1:BlindRegion) : void
      {
         this.m_objBlindRegion = param1;
      }
      
      public function setRemotePTZOperation(param1:RemotePTZOperation) : void
      {
         this.m_objRemotePTZOperation = param1;
      }
      
      public function setRemoteSensorUI(param1:RemoteSensorUI) : void
      {
         this.m_objRemoteSensorUI = param1;
      }
      
      public function setColorFlag(param1:int) : void
      {
         this.m_iColorFlag = param1;
      }
      
      public function setCameraId(param1:int) : void
      {
         this.m_iCameraId = param1;
      }
      
      public function initComponent() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         this.init();
         this.m_iWidth = this.width;
         this.m_iHeight = this.height;
         this.m_bIsFullScreen = false;
         if(this.m_iVideoUseType == 1)
         {
            ExternalInterface.addCallback("changeStream",this.switchStreamId);
            ExternalInterface.addCallback("startVideo",this.playVideo);
            ExternalInterface.addCallback("stopVideo",this.stopVideo);
            ExternalInterface.addCallback("changeMouseCursor",this.changeMouseCursor);
            ExternalInterface.addCallback("getIsPlayFlag",this.getIsPlayFlag);
            this.m_objMainUI.doubleClickEnabled = true;
            this.m_objMainUI.root.stage.doubleClickEnabled = true;
            this.m_objMainUI.root.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.FullScreenHandler);
            this.m_objMainUI.root.stage.addEventListener(MouseEvent.DOUBLE_CLICK,this.DoubleClickFullScreen);
            this.m_objMenuSprite = new DisplaySprite();
            this.m_objMenuSprite.graphics.beginFill(16777215);
            this.m_objMenuSprite.graphics.drawRect(0,0,CommonConst.CONST_VIDEO_WIDTH,CommonConst.CONST_VIDEO_HEIGHT);
            this.m_objMenuSprite.alpha = 0;
            this.m_objMainUI.addChildAt(this.m_objMenuSprite,this.m_objMainUI.numChildren);
            this.createMenu();
            this.addEventListenerForZoom();
            _loc1_ = ExternalInterface.call("getPTZParam");
            if(_loc1_)
            {
               this.changeMouseCursor(_loc1_.EnableThreeDimensionalPositioning);
            }
            this.preReadSensorSize();
         }
         else if(this.m_iVideoUseType == 2 || this.m_iVideoUseType == 3)
         {
            this.m_objBlindRegion = new BlindRegion(this.m_objScreen,this.m_iColorFlag,this.m_iVideoUseType,this.m_iLanguageId);
            if(this.m_objBlindRegion != null)
            {
               ExternalInterface.addCallback("MouseRightEvent",this.MouseRightEvent_ClickedHandler);
               ExternalInterface.addCallback("setAreaMask",this.m_objBlindRegion.changeAreaMask);
               ExternalInterface.addCallback("getRegion",this.m_objBlindRegion.getRegion);
               ExternalInterface.addCallback("setRegion",this.m_objBlindRegion.setRegion);
               this.m_objBlindRegion.addEventListener();
               _loc2_ = ExternalInterface.call("returnData");
               if(_loc2_ != null)
               {
                  if(this.m_iVideoUseType == 2)
                  {
                     ExternalInterface.addCallback("clearBlocks",this.m_objBlindRegion.clearBlocks);
                     ExternalInterface.addCallback("reverseBlocks",this.m_objBlindRegion.reverseBlocks);
                     this.m_objBlindRegion.init(_loc2_.nWidthCellNum,_loc2_.nHeightCellNum);
                  }
                  this.m_objBlindRegion.MaxAreaNum = int(_loc2_.maxAreaCount);
                  this.m_objBlindRegion.setRegion(_loc2_.areaData);
               }
            }
         }
         if(this.m_bShowBufferFlag)
         {
            this.m_objTopBar = new BorderContainer();
            this.m_objTopBar.x = 0;
            this.m_objTopBar.y = 0;
            this.m_objTopBar.width = this.m_objScreen.width - 2;
            this.m_objTopBar.height = 20;
            this.m_objTopBar.styleName = "ToolContainer";
            this.m_objScreen.addElementAt(this.m_objTopBar,this.m_objScreen.numElements);
            this.m_objBufferLabel = new Label();
            this.m_objBufferLabel.x = 0;
            this.m_objBufferLabel.y = 0;
            this.m_objBufferLabel.width = this.m_objScreen.width - 2;
            this.m_objBufferLabel.height = 20;
            this.m_objBufferLabel.styleName = "deviceName";
            this.m_objTopBar.addElement(this.m_objBufferLabel);
         }
      }
      
      private function switchStreamId(param1:int) : int
      {
         if(param1 == this.m_iCurrentStreamId)
         {
            return GeneralError.SN_SUCCESS;
         }
         this.m_objRemoteCamera.switchStream(param1,null);
         this.m_iCurrentStreamId = param1;
         return GeneralError.SN_SUCCESS;
      }
      
      public function init() : void
      {
         this.m_objRemoteCamera = new RemoteCamera();
         this.m_objRemoteCamera.deviceInfoEx = this.m_objDeviceInfoEx;
         this.m_objRemoteCamera.cameraId = 1;
         this.m_objFlashVideoPlayer = new FlashVideoPlayer(this.width,this.height);
         this.m_objFlashVideoPlayer.setBufferTime(0.1);
         this.m_objFlashVideoPlayer.setVideoTipInvoke(this.isVideoTotalNum);
         this.m_objFlashVideoPlayer.videoUseType = this.m_iVideoUseType;
         this.m_objFlashVideoPlayer.setInetAddr(this.m_objDeviceInfoEx.getDeviceAddr());
         this.m_objFlashVideoPlayer.setNetStatusInvoke(this.changeNetStatusInvoke);
         this.addChild(this.m_objFlashVideoPlayer);
         this.m_objRemotePTZOperation = new RemotePTZOperation(this.m_objDeviceInfoEx,this.m_iCameraId);
      }
      
      public function playVideo() : void
      {
         this.removeReconnect();
         this.initTipLab();
         this.m_bRemoveVideoFlag = false;
         this.m_objRemoteCamera.cameraId = this.m_iCameraId;
         this.m_objRemoteCamera.play(this.m_objFlashVideoPlayer);
      }
      
      public function rePlay() : void
      {
         this.initTipLab();
         this.m_objScreen.addElement(this);
         this.m_objRemoteCamera.rePlay(this.m_objFlashVideoPlayer);
      }
      
      public function stopVideo() : void
      {
         this.removeLivePlayer();
         this.m_objFlashVideoPlayer.stop();
      }
      
      public function setSensorVisibility(param1:int = 0) : void
      {
         this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("sensorConfig"),SensorUIData.m_bSupportFlag);
      }
      
      public function preReadSensorSize() : void
      {
         this.m_objRemoteSensorUI = new RemoteSensorUI(this.m_objMainUI,this.m_objClass,this.m_objDeviceInfoEx,this.m_iLanguageId,this.m_objLanguageXMLManager);
         this.m_objRemoteSensorUI.preReadSensorUISzie(this.setSensorVisibility);
      }
      
      private function getSourceResolution() : void
      {
         this.m_iSourceHeight = this.m_objFlashVideoPlayer.videoHeight;
         this.m_iSourceWidth = this.m_objFlashVideoPlayer.videoWidth;
      }
      
      public function changeMouseCursor(param1:Boolean) : void
      {
         var _loc2_:Vector.<BitmapData> = null;
         this.m_bThreeDimensionalPositionFlag = param1;
         if(this.m_bThreeDimensionalPositionFlag)
         {
            this.cursorData = new MouseCursorData();
            this.cursorData.hotSpot = new Point(10,10);
            _loc2_ = new Vector.<BitmapData>(2,true);
            this.cursorData.data = this.makeImage();
            Mouse.registerCursor("ptz_orientation",this.cursorData);
            Mouse.cursor = "ptz_orientation";
         }
         else
         {
            Mouse.cursor = MouseCursor.AUTO;
         }
      }
      
      private function initTipLab() : void
      {
         if(null != this.m_objTipLab)
         {
            this.m_objScreen.removeElement(this.m_objTipLab);
         }
         this.m_objTipLab = new Label();
         this.adjustTipLabSize();
         this.m_objTipLab.text = this.m_objLanguageXMLManager.getNameById("videoConnecting").toString();
         this.m_objTipLab.styleName = "VideoConnectTipLab";
         this.m_objScreen.addElementAt(this.m_objTipLab,this.m_objScreen.numElements);
         this.m_bVideoConnectionSuccessful = false;
         if(this.m_objCheckVideoConnectTimer.running)
         {
            this.m_objCheckVideoConnectTimer.stop();
         }
         this.m_objCheckVideoConnectTimer.addEventListener(TimerEvent.TIMER,this.toTimerHandler);
         this.m_objCheckVideoConnectTimer.start();
      }
      
      private function toTimerHandler(param1:TimerEvent) : void
      {
         if(this.m_bRemoveVideoFlag)
         {
            return;
         }
         this.checkVideoConnnection();
      }
      
      private function checkVideoConnnection() : void
      {
         if(null == this.m_objRemoteCamera || null == this.m_objFlashVideoPlayer)
         {
            return;
         }
         var _loc1_:Boolean = false;
         var _loc2_:String = "";
         var _loc3_:int = this.m_objRemoteCamera.getErrorCode();
         if(0 != _loc3_ || !this.m_objFlashVideoPlayer.connectFail)
         {
            if(-508 == _loc3_ || -507 == _loc3_)
            {
               _loc2_ = this.m_objLanguageXMLManager.getNameById("errorUsernameorPassword").toString();
            }
            else if(-511 == _loc3_)
            {
               _loc2_ = this.m_objLanguageXMLManager.getNameById("deviceConnReachMaxNum").toString();
            }
            else if(-213 == _loc3_ || NetworkIOError.SN_ERROR_NETWORKIO_ACCEPT_TIMEOUT == _loc3_)
            {
               _loc2_ = this.m_objLanguageXMLManager.getNameById("videoConnTimeout").toString();
            }
            else
            {
               _loc2_ = this.m_objLanguageXMLManager.getNameById("videoConnError").toString();
            }
            this.m_bVideoConnectionSuccessful = false;
            _loc1_ = true;
         }
         if((this.m_objFlashVideoPlayer.timeHead == 0 || isNaN(this.m_objFlashVideoPlayer.timeHead)) && this.m_bVideoTotalNum)
         {
            _loc2_ = this.m_objLanguageXMLManager.getNameById("videoConnReachMaxNum").toString();
            this.m_bVideoConnectionSuccessful = false;
            _loc1_ = true;
         }
         else if(this.m_objFlashVideoPlayer.isPlay)
         {
            if(!this.m_objScreen.contains(this))
            {
               this.m_objScreen.addElement(this);
            }
            this.removeTipLab();
            if(this.m_bShowBufferFlag)
            {
               setInterval(this.showBufferLength,1000);
            }
            this.m_bVideoConnectionSuccessful = true;
            _loc1_ = true;
            if(this.m_iHasVideoDataIntervalId > 0)
            {
               clearInterval(this.m_iHasVideoDataIntervalId);
               this.m_iHasVideoDataIntervalId = 0;
            }
            this.m_iHasVideoDataIntervalId = setInterval(this.checkVideoData,3 * 1000);
            this.m_iResetVideoTimeoutId = setTimeout(this.resetVideoForOldPlayer,4 * 1000);
         }
         if(this.m_iVideoUseType == 1)
         {
            this.resetVideoArea(false);
         }
         if(_loc1_ && this.m_objCheckVideoConnectTimer.running)
         {
            this.m_objCheckVideoConnectTimer.stop();
            if(null == this.m_objTipLab)
            {
               return;
            }
            this.m_bVideoTotalNum = false;
            this.m_objTipLab.text = _loc2_;
            if(!this.m_bVideoConnectionSuccessful)
            {
               this.m_iReconnectVideoId = setTimeout(this.playVideo,4000);
            }
         }
      }
      
      private function adjustTipLabSize() : void
      {
         if(this.m_objTipLab == null)
         {
            return;
         }
         this.m_objTipLab.x = 0;
         this.m_objTipLab.width = this.m_objScreen.width - 2;
         this.m_objTipLab.y = 0;
         this.m_objTipLab.height = this.m_objScreen.height - 2;
      }
      
      private function removeTipLab() : void
      {
         if(null != this.m_objTipLab)
         {
            this.m_objScreen.removeElement(this.m_objTipLab);
            this.m_objTipLab = null;
         }
      }
      
      private function isVideoTotalNum() : void
      {
         this.m_bVideoTotalNum = true;
      }
      
      private function makeImage() : Vector.<BitmapData>
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.lineStyle(1,16777215);
         _loc1_.graphics.moveTo(10,0);
         _loc1_.graphics.lineTo(10,20);
         _loc1_.graphics.moveTo(10,10);
         _loc1_.graphics.lineTo(0,10);
         _loc1_.graphics.moveTo(10,10);
         _loc1_.graphics.lineTo(20,10);
         _loc1_.graphics.endFill();
         var _loc2_:BitmapData = new BitmapData(32,32,true,0);
         _loc2_.draw(_loc1_);
         var _loc3_:Vector.<BitmapData> = new Vector.<BitmapData>();
         _loc3_.push(_loc2_);
         return _loc3_;
      }
      
      public function MouseRightEvent_ClickedHandler() : void
      {
         this.m_objBlindRegion.popRegion();
      }
      
      private function createMenu() : void
      {
         this.m_objRightClickMenu = new ContextMenu();
         this.m_objMenuSprite.contextMenu = this.m_objRightClickMenu;
         this.m_objRightClickMenu.hideBuiltInItems();
         this.createCommonMenuItem();
      }
      
      private function createCommonMenuItem() : void
      {
         if(this.m_objLanguageXMLManager.getNameById("sensorConfig").toString() == "")
         {
            setTimeout(this.createCommonMenuItem,1000);
            return;
         }
         var _loc1_:ContextMenuItem = new ContextMenuItem(this.m_objLanguageXMLManager.getNameById("sensorConfig"));
         var _loc2_:ContextMenuItem = new ContextMenuItem(this.m_objLanguageXMLManager.getNameById("zoomIn"));
         var _loc3_:ContextMenuItem = new ContextMenuItem(this.m_objLanguageXMLManager.getNameById("zoomOut"));
         var _loc4_:ContextMenuItem = new ContextMenuItem(this.m_objLanguageXMLManager.getNameById("restore"));
         _loc4_.enabled = false;
         this.m_objRightClickMenu.customItems.push(_loc1_);
         this.m_objRightClickMenu.customItems.push(_loc2_);
         this.m_objRightClickMenu.customItems.push(_loc3_);
         this.m_objRightClickMenu.customItems.push(_loc4_);
         _loc1_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.SensorConfigHandler,false,13);
         _loc2_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.ZoomIn_ClickedHandler,false,12);
         _loc3_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.ZoomOut_ClickedHandler,false,11);
         _loc4_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.RestoreZoom_ClickedHandler,false,10);
      }
      
      private function FullScreenHandler(param1:FullScreenEvent) : void
      {
         if(!param1.fullScreen)
         {
            this.m_objScreen.x = 0;
            this.m_objScreen.y = 0;
            this.m_objScreen.width = this.m_iWidth + 2;
            this.m_objScreen.height = this.m_iHeight + 2;
            this.m_bIsFullScreen = false;
            if(this.m_bIsLargeZoom)
            {
               this.m_objFlashVideoPlayer.resetVideoSize(this.m_objFlashVideoPlayer.videoAreaRect);
            }
            this.m_objMainUI.removeChild(this.m_objMenuSprite);
            this.m_objMainUI.addChildAt(this.m_objMenuSprite,this.m_objMainUI.numChildren);
            if(this.m_bSensorCloseFlag)
            {
               this.m_bSensorCloseFlag = false;
               this.m_objRemoteSensorUI.Cancel_ClickHandler(null);
            }
            this.changeMouseCursor(this.m_bThreeDimensionalPositionFlag);
            this.resetVideoArea(false);
         }
         else
         {
            this.m_bIsFullScreen = true;
            Mouse.cursor = MouseCursor.AUTO;
         }
         if(this.m_bIsFullScreen)
         {
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("restore"),!this.m_bIsFullScreen);
         }
         if(!this.m_bIsFullScreen && this.m_bIsLargeZoom)
         {
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("restore"),this.m_bIsLargeZoom);
         }
         this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomIn"),!this.m_bIsFullScreen);
         this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomOut"),!this.m_bIsFullScreen);
         this.m_bPressFlag = false;
      }
      
      private function DoubleClickFullScreen(param1:MouseEvent) : void
      {
         this.m_objScreen.x = 0;
         this.m_objScreen.y = 0;
         this.getSourceResolution();
         if(!this.m_objFlashVideoPlayer.isPlay)
         {
            return;
         }
         if(!this.m_bIsFullScreen)
         {
            this.m_objFlashVideoPlayer.mask = null;
         }
         this.m_objMainUI.root.stage.scaleMode = StageScaleMode.NO_SCALE;
         if(this.m_objMainUI.root.stage.displayState == StageDisplayState.NORMAL)
         {
            this.m_objMainUI.root.stage.fullScreenSourceRect = new Rectangle(0,0,this.m_iScreenWidth,this.m_iScreenHeight);
            this.m_objMainUI.root.stage.displayState = StageDisplayState.FULL_SCREEN;
            this.m_objScreen.width = this.m_iScreenWidth;
            this.m_objScreen.height = this.m_iScreenHeight;
            this.clipAndEnableScrolling = false;
            this.resetVideoArea(false);
         }
         else
         {
            this.clipAndEnableScrolling = true;
            this.m_objMainUI.root.stage.displayState = StageDisplayState.NORMAL;
         }
      }
      
      private function setContextMenuItemEnable(param1:String, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:ContextMenuItem = null;
         for(_loc3_ in this.m_objRightClickMenu.customItems)
         {
            _loc4_ = ContextMenuItem(this.m_objRightClickMenu.customItems[_loc3_]);
            if(_loc4_.caption == param1)
            {
               _loc4_.enabled = param2;
               break;
            }
         }
      }
      
      private function ExitFullScreenHandler(param1:ContextMenuEvent) : void
      {
         if(this.m_objMainUI.root.stage.displayState == StageDisplayState.FULL_SCREEN)
         {
            this.m_objMainUI.root.stage.displayState = StageDisplayState.NORMAL;
         }
      }
      
      private function SensorConfigHandler(param1:ContextMenuEvent) : void
      {
         var _loc2_:String = null;
         if(this.m_nSensorHeight == 0 || this.m_nSensorWidth == 0)
         {
            _loc2_ = SensorTool.findSensorUISize(SensorUIData.m_strUIStyle,"width");
            if(_loc2_ != null && _loc2_ != "undefined")
            {
               this.m_nSensorWidth = int(_loc2_);
            }
            _loc2_ = SensorTool.findSensorUISize(SensorUIData.m_strUIStyle,"height");
            if(_loc2_ != null && _loc2_ != "undefined")
            {
               this.m_nSensorHeight = int(_loc2_);
            }
         }
         if(this.m_bIsFullScreen)
         {
            this.m_bSensorCloseFlag = true;
            this.m_objRemoteSensorUI = new RemoteSensorUI(this.m_objMainUI,this.m_objClass,this.m_objDeviceInfoEx,this.m_iLanguageId,this.m_objLanguageXMLManager);
            this.m_objRemoteSensorUI.setFullScrFlag(true);
            this.m_objRemoteSensorUI.setSensorCloseFlagFunction(this.setSensorConfigCloseFlag);
            this.m_objRemoteSensorUI.sendSensorCommand();
         }
         else
         {
            if(!this.m_objFlashVideoPlayer.isPlay)
            {
               return;
            }
            ExternalInterface.call("displaySensorConfig",this.m_nSensorWidth,this.m_nSensorHeight);
         }
      }
      
      public function setClass(param1:Class) : void
      {
         this.m_objClass = param1;
      }
      
      public function setSensorConfigCloseFlag(param1:Boolean) : void
      {
         this.m_bSensorCloseFlag = param1;
      }
      
      private function addEventListenerForZoom() : void
      {
         this.m_objMainUI.addEventListener(MouseEvent.MOUSE_DOWN,this.Press_ClickedHandler,false,7);
         this.m_objMainUI.addEventListener(MouseEvent.MOUSE_MOVE,this.Move_ClickedHandler,false,6);
         this.m_objMainUI.addEventListener(MouseEvent.MOUSE_UP,this.Up_ClickedHandler,false,5);
         this.m_bPressFlag = false;
      }
      
      private function removeEventListenerForZoom() : void
      {
         this.m_objMainUI.removeEventListener(MouseEvent.MOUSE_DOWN,this.Press_ClickedHandler);
         this.m_objMainUI.removeEventListener(MouseEvent.MOUSE_MOVE,this.Move_ClickedHandler);
         this.m_objMainUI.removeEventListener(MouseEvent.MOUSE_UP,this.Up_ClickedHandler);
         this.m_bPressFlag = false;
      }
      
      private function Move_ClickedHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.m_bPressFlag && param1.buttonDown)
         {
            _loc2_ = param1.stageX;
            _loc3_ = param1.stageY;
            if(this.m_objScreen.x + this.x + this.width < _loc2_ && this.m_objScreen.x + this.m_objScreen.width > _loc2_)
            {
               _loc2_ = this.m_objScreen.x + this.x + this.width;
            }
            else if(this.m_objScreen.x < _loc2_ && this.x + this.m_objScreen.x > _loc2_)
            {
               _loc2_ = this.x + this.m_objScreen.x;
            }
            if(this.m_objScreen.y + this.m_objScreen.height > _loc3_ && this.m_objScreen.y + this.y + this.height < _loc3_)
            {
               _loc3_ = this.m_objScreen.y + this.y + this.height;
            }
            else if(this.m_objScreen.y < _loc3_ && this.y + this.m_objScreen.y > _loc3_)
            {
               _loc3_ = this.y + this.m_objScreen.y;
            }
            if(this.m_iCount != 0)
            {
               this.m_objZoomSprite.graphics.clear();
            }
            else
            {
               this.m_objZoomSprite = new SpriteVisualElement();
               this.m_objZoomSprite.width = this.m_objScreen.width;
               this.m_objZoomSprite.height = this.m_objScreen.height;
            }
            if(this.m_objScreen.x + this.m_objScreen.width <= param1.stageX)
            {
               this.m_bIsZoom = false;
               return;
            }
            if(this.m_objScreen.x >= param1.stageX)
            {
               this.m_bIsZoom = false;
               return;
            }
            if(this.m_objScreen.y + this.m_objScreen.height <= param1.stageY)
            {
               this.m_bIsZoom = false;
               return;
            }
            if(this.m_objScreen.y >= param1.stageY)
            {
               this.m_bIsZoom = false;
               return;
            }
            this.m_iPressMoveWidth = _loc2_ - this.m_iPressX;
            this.m_iPressMoveHeight = _loc3_ - this.m_iPressY;
            this.m_objZoomSprite.graphics.lineStyle(1,65280,1,true,LineScaleMode.NONE,CapsStyle.SQUARE);
            this.m_objZoomSprite.graphics.moveTo(this.m_iPressX - this.m_objScreen.x,this.m_iPressY - this.m_objScreen.y);
            this.m_objZoomSprite.graphics.lineTo(this.m_iPressX - this.m_objScreen.x,this.m_iPressY - this.m_objScreen.y + this.m_iPressMoveHeight);
            this.m_objZoomSprite.graphics.lineTo(this.m_iPressX - this.m_objScreen.x + this.m_iPressMoveWidth,this.m_iPressY - this.m_objScreen.y + this.m_iPressMoveHeight);
            this.m_objZoomSprite.graphics.lineTo(this.m_iPressX - this.m_objScreen.x + this.m_iPressMoveWidth,this.m_iPressY - this.m_objScreen.y);
            this.m_objZoomSprite.graphics.lineTo(this.m_iPressX - this.m_objScreen.x,this.m_iPressY - this.m_objScreen.y);
            if(this.m_iCount == 0)
            {
               this.m_objScreen.addElementAt(this.m_objZoomSprite,this.m_objScreen.numElements);
            }
            this.m_iCount++;
            this.m_bIsZoom = true;
         }
         else
         {
            this.m_bPressFlag = false;
            if(this.m_iCount != 0)
            {
               if(null != this.m_objZoomSprite)
               {
                  this.m_objZoomSprite.graphics.clear();
               }
            }
         }
      }
      
      private function Up_ClickedHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Rectangle = null;
         if(this.m_bPressFlag)
         {
            if(this.m_iCount >= 1 && this.m_iVideoUseType == 1)
            {
               if(null != this.m_objZoomSprite)
               {
                  this.m_objZoomSprite.graphics.clear();
                  this.m_objScreen.removeElement(this.m_objZoomSprite);
                  this.m_objZoomSprite = null;
               }
            }
            if(this.m_iVideoUseType == 1 && this.m_bThreeDimensionalPositionFlag)
            {
               this.m_bIsZoom = true;
            }
            _loc2_ = this.m_objFlashVideoPlayer.videoHeight / this.m_objFlashVideoPlayer.videoWidth;
            this.m_bPressFlag = false;
            if(this.m_bIsZoom)
            {
               _loc3_ = null;
               if(this.m_bThreeDimensionalPositionFlag)
               {
                  _loc3_ = new Rectangle(this.m_iPressX,this.m_iPressY,this.m_iPressMoveWidth,this.m_iPressMoveHeight);
                  this.m_objRemotePTZOperation.controlPTZ(this.handlePTZOrientation(_loc3_));
               }
               else
               {
                  if(this.m_iPressMoveWidth < 0)
                  {
                     this.m_iPressX = this.m_iPressX + this.m_iPressMoveWidth;
                     if(this.m_iPressMoveHeight < 0)
                     {
                        this.m_iPressY = this.m_iPressY + this.m_iPressMoveHeight;
                     }
                  }
                  else if(this.m_iPressMoveHeight < 0)
                  {
                     this.m_iPressY = this.m_iPressY + this.m_iPressMoveHeight;
                  }
                  this.m_iPressMoveWidth = Math.abs(this.m_iPressMoveWidth);
                  this.m_iPressMoveHeight = Math.abs(this.m_iPressMoveHeight);
                  _loc3_ = new Rectangle(this.m_iPressX,this.m_iPressY,this.m_iPressMoveWidth,this.m_iPressMoveHeight);
                  this.zoomInVideo(_loc3_);
                  this.m_bIsLargeZoom = true;
                  this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("restore"),this.m_bIsLargeZoom);
                  this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomOut"),this.m_bIsLargeZoom);
               }
            }
         }
         this.m_bIsZoom = false;
         this.m_iPressX = 0;
         this.m_iPressY = 0;
         this.m_iPressMoveWidth = 0;
         this.m_iPressMoveHeight = 0;
      }
      
      private function Press_ClickedHandler(param1:MouseEvent) : void
      {
         if(null != this.m_objZoomSprite)
         {
            this.m_objZoomSprite.graphics.clear();
         }
         if(this.m_bSensorCloseFlag || this.m_bIsFullScreen || this.m_objFlashVideoPlayer.timeHead <= 0 || isNaN(this.m_objFlashVideoPlayer.timeHead))
         {
            return;
         }
         this.m_bIsZoom = false;
         this.m_iPressMoveWidth = 0;
         this.m_iPressMoveHeight = 0;
         this.m_iCount = 0;
         if(null == this.m_objZoomRect)
         {
            this.m_objZoomRect = new Rectangle();
            this.m_objZoomRect.x = this.m_objFlashVideoPlayer.videoAreaRect.x;
            this.m_objZoomRect.y = this.m_objFlashVideoPlayer.videoAreaRect.y;
            this.m_objZoomRect.width = this.m_objFlashVideoPlayer.videoAreaRect.width;
            this.m_objZoomRect.height = this.m_objFlashVideoPlayer.videoAreaRect.height;
            this.m_nCurrentZoomPicWidth = this.m_objFlashVideoPlayer.videoAreaRect.width;
            this.m_nCurrentZoomPicHeight = this.m_objFlashVideoPlayer.videoAreaRect.height;
         }
         this.m_iPressX = param1.stageX;
         this.m_iPressY = param1.stageY;
         this.m_bPressFlag = true;
         if(this.m_objScreen.x + this.x + this.width < this.m_iPressX && this.m_objScreen.x + this.m_objScreen.width > this.m_iPressX)
         {
            this.m_iPressX = this.m_objScreen.x + this.x + this.width;
         }
         else if(this.m_objScreen.x + this.x > this.m_iPressX)
         {
            this.m_iPressX = this.x + this.m_objScreen.x;
         }
         if(this.m_objScreen.y + this.y + this.height < this.m_iPressY && this.m_objScreen.y + this.m_objScreen.height > this.m_iPressY)
         {
            this.m_iPressY = this.m_objScreen.y + this.y + this.height;
         }
         else if(this.m_objScreen.y + this.y > this.m_iPressY)
         {
            this.m_iPressY = this.y + this.m_objScreen.y;
         }
      }
      
      protected function ZoomIn_ClickedHandler(param1:ContextMenuEvent) : void
      {
         var _loc2_:int = this.rightKeyZoomInVideo();
         if(_loc2_ == GeneralError.SN_SUCCESS)
         {
            this.m_bIsLargeZoom = true;
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("restore"),this.m_bIsLargeZoom);
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomOut"),this.m_bIsLargeZoom);
         }
         this.m_bPressFlag = false;
      }
      
      protected function ZoomOut_ClickedHandler(param1:ContextMenuEvent) : void
      {
         this.rightKeyZoomOutVideo();
         this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("restore"),this.m_bIsLargeZoom);
         this.m_bPressFlag = false;
      }
      
      protected function RestoreZoom_ClickedHandler(param1:ContextMenuEvent) : void
      {
         if(this.m_bIsLargeZoom)
         {
            if(null != this.m_objZoomRect)
            {
               this.m_objZoomRect = null;
               this.m_nCurrentZoomPicWidth = this.m_objFlashVideoPlayer.videoAreaRect.width;
               this.m_nCurrentZoomPicHeight = this.m_objFlashVideoPlayer.videoAreaRect.height;
            }
            this.m_objFlashVideoPlayer.resetVideoSize(this.m_objFlashVideoPlayer.videoAreaRect);
            this.m_bIsLargeZoom = false;
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("restore"),this.m_bIsLargeZoom);
         }
         this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomIn"),!this.m_bIsLargeZoom);
         this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomOut"),this.m_bIsLargeZoom);
         this.m_bPressFlag = false;
      }
      
      private function zoomInVideo(param1:Rectangle) : int
      {
         if(param1.width == 0 || param1.height == 0)
         {
            return GeneralError.SN_ERROR_BAD_PARAMETER;
         }
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         var _loc4_:Number = param1.width;
         var _loc5_:Number = param1.height;
         var _loc6_:Number = this.m_nCurrentZoomPicWidth / this.m_objFlashVideoPlayer.videoAreaRect.width;
         var _loc7_:Rectangle = new Rectangle();
         _loc7_.x = _loc2_ - (this.m_objScreen.x + this.x);
         _loc7_.width = _loc4_;
         _loc7_.y = _loc3_ - (this.m_objScreen.y + this.y);
         _loc7_.height = _loc5_;
         var _loc8_:Rectangle = new Rectangle();
         this.resetZoomRect(this.m_objFlashVideoPlayer.videoAreaRect.width,this.m_objFlashVideoPlayer.videoAreaRect.height,_loc7_,_loc8_);
         var _loc9_:Number = _loc8_.width * _loc6_;
         var _loc10_:Number = _loc8_.height * _loc6_;
         var _loc11_:Number = this.m_objFlashVideoPlayer.videoAreaRect.width / 630;
         var _loc12_:Number = this.m_objFlashVideoPlayer.videoAreaRect.height / 361;
         if(_loc9_ <= _loc11_ * 2 * 20 || _loc10_ <= _loc12_ * 2 * 20)
         {
            return GeneralError.SN_ERROR_BAD_PARAMETER;
         }
         this.m_objZoomRect.x = this.m_objZoomRect.x + _loc8_.x * _loc6_;
         this.m_objZoomRect.width = _loc9_ > this.m_objFlashVideoPlayer.videoAreaRect.width?Number(this.m_objFlashVideoPlayer.videoAreaRect.width):Number(_loc9_);
         this.m_objZoomRect.y = this.m_objZoomRect.y + _loc8_.y * _loc6_;
         this.m_objZoomRect.height = _loc10_ > this.m_objFlashVideoPlayer.videoAreaRect.height?Number(this.m_objFlashVideoPlayer.videoAreaRect.height):Number(_loc10_);
         this.m_nCurrentZoomPicWidth = this.m_objZoomRect.width;
         this.m_nCurrentZoomPicHeight = this.m_objZoomRect.height;
         this.m_objFlashVideoPlayer.resetVideoSize(this.m_objZoomRect);
         return GeneralError.SN_SUCCESS;
      }
      
      private function rightKeyZoomInVideo() : int
      {
         var _loc1_:Number = this.m_objFlashVideoPlayer.videoAreaRect.height;
         var _loc2_:Number = this.m_objFlashVideoPlayer.videoAreaRect.width;
         var _loc3_:Number = this.m_objFlashVideoPlayer.height / _loc1_;
         if(_loc3_ >= 2)
         {
            return GeneralError.SN_ERROR_BAD_PARAMETER;
         }
         this.m_objFlashVideoPlayer.width = this.m_objFlashVideoPlayer.width + 0.1 * _loc2_;
         this.m_objFlashVideoPlayer.height = this.m_objFlashVideoPlayer.height + 0.1 * _loc1_;
         _loc3_ = _loc3_ + 0.1;
         if(1 / _loc3_ <= 0.5)
         {
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomIn"),false);
         }
         this.m_objFlashVideoPlayer.x = this.m_objFlashVideoPlayer.videoAreaRect.x - _loc2_ * (_loc3_ - 1) / 2;
         this.m_objFlashVideoPlayer.y = this.m_objFlashVideoPlayer.videoAreaRect.y - _loc1_ * (_loc3_ - 1) / 2;
         return GeneralError.SN_SUCCESS;
      }
      
      private function rightKeyZoomOutVideo() : int
      {
         var _loc1_:Number = this.m_objFlashVideoPlayer.videoAreaRect.height;
         var _loc2_:Number = this.m_objFlashVideoPlayer.videoAreaRect.width;
         var _loc3_:Number = this.m_objFlashVideoPlayer.height / _loc1_;
         this.m_objFlashVideoPlayer.width = this.m_objFlashVideoPlayer.width - 0.1 * _loc2_;
         this.m_objFlashVideoPlayer.height = this.m_objFlashVideoPlayer.height - 0.1 * _loc1_;
         _loc3_ = _loc3_ - 0.1;
         if(1 / _loc3_ >= 0.99)
         {
            this.m_objFlashVideoPlayer.x = 0;
            this.m_objFlashVideoPlayer.y = 0;
            this.m_objFlashVideoPlayer.width = _loc2_;
            this.m_objFlashVideoPlayer.height = _loc1_;
            this.m_bIsLargeZoom = false;
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomOut"),false);
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("restore"),this.m_bIsLargeZoom);
            this.setContextMenuItemEnable(this.m_objLanguageXMLManager.getNameById("zoomIn"),!this.m_bIsLargeZoom);
            return GeneralError.SN_SUCCESS;
         }
         if(this.m_objFlashVideoPlayer.videoAreaRect.x - this.m_objFlashVideoPlayer.x < _loc2_ * (_loc3_ - 1) / 2)
         {
            this.m_objFlashVideoPlayer.x = 0;
         }
         else
         {
            this.m_objFlashVideoPlayer.x = this.m_objFlashVideoPlayer.videoAreaRect.x - _loc2_ * (_loc3_ - 1) / 2;
         }
         if(this.m_objFlashVideoPlayer.videoAreaRect.y - this.m_objFlashVideoPlayer.y < _loc1_ * (_loc3_ - 1) / 2)
         {
            this.m_objFlashVideoPlayer.y = 0;
         }
         else
         {
            this.m_objFlashVideoPlayer.y = this.m_objFlashVideoPlayer.videoAreaRect.y - _loc1_ * (_loc3_ - 1) / 2;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      private function zoomOutVideo(param1:Rectangle) : int
      {
         if(param1.width == 0 || param1.height == 0)
         {
            return GeneralError.SN_ERROR_BAD_PARAMETER;
         }
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         var _loc4_:Number = param1.width;
         var _loc5_:Number = param1.height;
         var _loc6_:Number = this.m_nCurrentZoomPicWidth / this.m_objFlashVideoPlayer.videoAreaRect.width;
         var _loc7_:Rectangle = new Rectangle();
         _loc7_.x = _loc2_ - (this.m_objScreen.x + this.x);
         _loc7_.width = _loc4_;
         _loc7_.y = _loc3_ - (this.m_objScreen.y + this.y);
         _loc7_.height = _loc5_;
         var _loc8_:Rectangle = new Rectangle();
         this.resetZoomRect(this.m_objFlashVideoPlayer.videoAreaRect.width,this.m_objFlashVideoPlayer.videoAreaRect.height,_loc7_,_loc8_);
         var _loc9_:Number = _loc8_.width * _loc6_;
         var _loc10_:Number = _loc8_.height * _loc6_;
         var _loc11_:Number = this.m_objFlashVideoPlayer.videoAreaRect.width / 630;
         var _loc12_:Number = this.m_objFlashVideoPlayer.videoAreaRect.height / 361;
         if(_loc9_ <= _loc11_ * 2 * 20 || _loc10_ <= _loc12_ * 2 * 20)
         {
            return GeneralError.SN_ERROR_BAD_PARAMETER;
         }
         this.m_objZoomRect.x = this.m_objZoomRect.x + _loc8_.x * _loc6_;
         this.m_objZoomRect.width = _loc9_ > this.m_objFlashVideoPlayer.videoAreaRect.width?Number(this.m_objFlashVideoPlayer.videoAreaRect.width):Number(_loc9_);
         this.m_objZoomRect.y = this.m_objZoomRect.y + _loc8_.y * _loc6_;
         this.m_objZoomRect.height = _loc10_ > this.m_objFlashVideoPlayer.videoAreaRect.height?Number(this.m_objFlashVideoPlayer.videoAreaRect.height):Number(_loc10_);
         this.m_nCurrentZoomPicWidth = this.m_objZoomRect.width;
         this.m_nCurrentZoomPicHeight = this.m_objZoomRect.height;
         this.m_objFlashVideoPlayer.resetVideoSize(this.m_objZoomRect);
         return GeneralError.SN_SUCCESS;
      }
      
      private function resetZoomRect(param1:int, param2:int, param3:Rectangle, param4:Rectangle) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc5_:Number = 3 / 4;
         if(param1 != 0)
         {
            _loc5_ = param2 * 1 / (param1 * 1);
         }
         var _loc6_:Number = param3.width;
         var _loc7_:Number = param3.height;
         if(_loc7_ * 1 / (_loc6_ * 1) >= _loc5_)
         {
            _loc10_ = _loc7_ / _loc5_;
            _loc8_ = param3.x - (_loc10_ - _loc6_) / 2;
            if(_loc8_ < 0)
            {
               _loc8_ = 0;
            }
            _loc6_ = _loc10_;
            _loc9_ = param3.y;
         }
         else
         {
            _loc11_ = _loc6_ * _loc5_;
            _loc9_ = param3.y - (_loc11_ - _loc7_) / 2;
            if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
            _loc7_ = _loc11_;
            _loc8_ = param3.x;
         }
         if(_loc8_ + _loc6_ > param1)
         {
            _loc8_ = _loc8_ - (_loc8_ + _loc6_ - param1);
         }
         param4.x = _loc8_ < 0?Number(0):Number(_loc8_);
         param4.width = _loc6_;
         if(_loc9_ + _loc7_ > param2)
         {
            _loc9_ = _loc9_ - (_loc9_ + _loc7_ - param2);
         }
         param4.y = _loc9_ < 0?Number(0):Number(_loc9_);
         param4.height = _loc7_;
      }
      
      public function handlePTZOrientation(param1:Rectangle) : String
      {
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc2_:Number = this.m_objFlashVideoPlayer.videoWidth;
         var _loc3_:Number = this.m_objFlashVideoPlayer.videoHeight;
         var _loc4_:Rectangle = this.m_objFlashVideoPlayer.videoAreaRect;
         var _loc5_:Rectangle = new Rectangle();
         PlayerUI.resetDisplayRect(_loc2_,_loc3_,_loc4_,_loc5_);
         var _loc6_:Number = _loc5_.x + _loc5_.width / 2;
         var _loc7_:Number = _loc5_.y + _loc5_.height / 2;
         var _loc8_:Number = _loc5_.width;
         var _loc9_:Number = _loc5_.height;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         if(param1.width == 0 && param1.height == 0)
         {
            _loc10_ = param1.x - _loc6_;
            _loc11_ = param1.y - _loc7_;
            _loc12_ = _loc10_ * 100 * 2 / _loc8_;
            _loc13_ = _loc11_ * 100 * 2 / _loc9_;
            return this.getStringCommand(_loc12_,_loc13_,0);
         }
         _loc14_ = param1.x - _loc6_;
         _loc15_ = param1.y - _loc7_;
         _loc10_ = param1.x + param1.width - _loc6_;
         _loc11_ = param1.y + param1.height - _loc7_;
         _loc12_ = (_loc10_ + _loc14_) * 100 / _loc8_;
         _loc13_ = (_loc11_ + _loc15_) * 100 / _loc9_;
         _loc16_ = Math.abs(_loc10_ - _loc14_) * Math.abs(_loc11_ - _loc15_);
         _loc17_ = 0;
         if(_loc16_ > 0)
         {
            _loc17_ = _loc8_ * _loc9_ / _loc16_ + 0.5;
         }
         if(param1.height > 0)
         {
            return this.getStringCommand(_loc12_,_loc13_,_loc17_);
         }
         return this.getStringCommand(_loc12_,_loc13_,-_loc17_);
      }
      
      private function getStringCommand(param1:Number, param2:Number, param3:Number) : String
      {
         var _loc4_:Number = param1;
         var _loc5_:Number = param2;
         var _loc6_:Number = param3;
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
         return _loc7_;
      }
      
      public function resetVideoArea(param1:Boolean) : void
      {
         var p_bFlag:Boolean = param1;
         try
         {
            this.m_bIsLargeZoom = true;
            this.RestoreZoom_ClickedHandler(null);
            if(null != this.m_objTipLab)
            {
               this.adjustTipLabSize();
            }
            this.m_objMenuSprite.graphics.clear();
            this.m_objMenuSprite.graphics.beginFill(16777215);
            this.m_objMenuSprite.graphics.drawRect(0,0,this.m_objScreen.width,this.m_objScreen.height);
            this.m_objMenuSprite.alpha = 0;
            this.m_objFlashVideoPlayer.videoWindowWidth = this.m_objScreen.width - 2;
            this.m_objFlashVideoPlayer.videoWindowHeight = this.m_objScreen.height - 2;
            this.m_objFlashVideoPlayer.adjustVideoSize();
            this.width = this.m_objFlashVideoPlayer.videoAreaRect.width;
            this.height = this.m_objFlashVideoPlayer.videoAreaRect.height;
            x = this.m_objFlashVideoPlayer.videoAreaRect.x;
            y = this.m_objFlashVideoPlayer.videoAreaRect.y;
            this.m_objFlashVideoPlayer.videoAreaRect.y = 0;
            this.m_objFlashVideoPlayer.videoAreaRect.x = 0;
            this.m_objFlashVideoPlayer.y = 0;
            this.m_objFlashVideoPlayer.x = 0;
            return;
         }
         catch(e:Error)
         {
            return;
         }
         finally
         {
            this.m_objFlashVideoPlayer.videoWindowWidth = this.m_objScreen.width - 2;
            this.m_objFlashVideoPlayer.videoWindowHeight = this.m_objScreen.height - 2;
            this.m_objFlashVideoPlayer.adjustVideoSize();
            this.width = this.m_objFlashVideoPlayer.videoAreaRect.width;
            this.height = this.m_objFlashVideoPlayer.videoAreaRect.height;
            x = this.m_objFlashVideoPlayer.videoAreaRect.x;
            y = this.m_objFlashVideoPlayer.videoAreaRect.y;
            this.m_objFlashVideoPlayer.videoAreaRect.y = 0;
            this.m_objFlashVideoPlayer.videoAreaRect.x = 0;
            this.m_objFlashVideoPlayer.y = 0;
            this.m_objFlashVideoPlayer.x = 0;
         }
      }
      
      public function removeLivePlayer() : void
      {
         this.removeReconnect();
         this.m_objScreen.useFlag = false;
         if(null != this.m_objZoomSprite)
         {
            this.m_objZoomSprite.graphics.clear();
         }
         this.m_bRemoveVideoFlag = true;
         if(this.m_objCheckVideoConnectTimer.running)
         {
            this.m_objCheckVideoConnectTimer.stop();
         }
         if(0 < this.m_iResetVideoTimeoutId)
         {
            clearTimeout(this.m_iResetVideoTimeoutId);
            this.m_iResetVideoTimeoutId = 0;
         }
         if(0 != this.m_iHasVideoDataIntervalId)
         {
            clearInterval(this.m_iHasVideoDataIntervalId);
            this.m_iHasVideoDataIntervalId = 0;
         }
         this.removeTipLab();
         this.m_bVideoConnectionSuccessful = false;
         if(this.m_objScreen.contains(this))
         {
            this.m_objScreen.removeElement(this);
         }
      }
      
      private function resetVideoForOldPlayer() : void
      {
         if(this.m_objFlashVideoPlayer.x > 0 || this.m_objFlashVideoPlayer.y > 0)
         {
            this.resetVideoArea(false);
         }
      }
      
      private function removeReconnect() : void
      {
         if(this.m_iReconnectVideoId > 0)
         {
            clearTimeout(this.m_iReconnectVideoId);
            this.m_iReconnectVideoId = 0;
         }
      }
      
      protected function checkVideoData() : void
      {
         var _loc1_:Date = null;
         if(!this.m_objFlashVideoPlayer.isPlay)
         {
            this.m_bSameBufferSize = false;
            return;
         }
         if(this.m_nBufferSize == this.m_objFlashVideoPlayer.timeHead)
         {
            _loc1_ = new Date();
            if(!this.m_bSameBufferSize)
            {
               this.m_bSameBufferSize = true;
               this.m_nCurrentTime = _loc1_.getTime();
            }
            else if(_loc1_.getTime() - this.m_nCurrentTime > 10 * 1000)
            {
               this.m_objFlashVideoPlayer.stop();
            }
         }
         else
         {
            this.m_bSameBufferSize = false;
            this.m_nBufferSize = this.m_objFlashVideoPlayer.timeHead;
         }
      }
      
      public function changeNetStatusInvoke(param1:String) : void
      {
         if(this.m_iVideoUseType != 1)
         {
            return;
         }
         if("NetStream.Video.DimensionChange" == param1)
         {
            this.m_objFlashVideoPlayer.SourceVideoWidth = this.m_objFlashVideoPlayer.videoWidth;
            this.m_objFlashVideoPlayer.SourceVideoHeight = this.m_objFlashVideoPlayer.videoHeight;
            this.resetVideoArea(false);
         }
         if("NetConnection.Connect.Closed" == param1)
         {
            if(this.m_bRemoveVideoFlag)
            {
               return;
            }
            this.playVideo();
         }
      }
      
      public function showBufferLength() : void
      {
         if(this.m_objTopBar == null || this.m_objBufferLabel == null)
         {
            return;
         }
         if(this.m_objBufferLabel != null)
         {
            this.m_objBufferLabel.text = "buffer:" + this.m_objFlashVideoPlayer.BufferLength + " timehead:" + this.m_objFlashVideoPlayer.timeHead;
         }
         if(this.m_objFlashVideoPlayer.BufferLength < this.m_objFlashVideoPlayer.getMinBufferLength())
         {
            this.m_uCount++;
         }
         else
         {
            this.m_uCount = 0;
         }
         if(this.m_uCount > 6)
         {
            this.m_uCount = 0;
         }
      }
      
      public function getIsPlayFlag() : Boolean
      {
         return this.m_objFlashVideoPlayer.isPlay;
      }
   }
}
