package ipc.style1.ui
{
   import common.logic.domain.DeviceType;
   import common.logic.share.CommonConst;
   import common.sdk.LanguageConst;
   import common.sdk.LanguageXMLManager;
   import common.sdk.PlayerUI;
   import common.sdk.Screen;
   import common.sdk.ScreenWall;
   import common.service.SNSocket.DeviceInfoEx;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import mx.core.Application;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.styles.CSSCondition;
   import mx.styles.CSSSelector;
   import mx.styles.CSSStyleDeclaration;
   
   public class liveVideo extends Application
   {
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var m_objLanguageXMLManager:LanguageXMLManager;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_iLanguageId:int;
      
      private var m_screenHeight:Number;
      
      private var m_screenWidth:Number;
      
      private var m_iVideoUseType:int;
      
      private var m_iColorFlag:int;
      
      private var m_objClass:Class;
      
      private var m_iCameraId:int = 1;
      
      private var m_uScreenNum:uint = 1;
      
      private var m_uScreenLayoutMode:uint;
      
      private var m_objScreenWall:ScreenWall;
      
      private var m_objScreen:Screen;
      
      private var m_objPlayerUI:PlayerUI;
      
      mx_internal var _liveVideo_StylesInit_done:Boolean = false;
      
      public function liveVideo()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Application,
            "events":{
               "creationComplete":"___liveVideo_Application1_creationComplete",
               "preinitialize":"___liveVideo_Application1_preinitialize",
               "applicationComplete":"___liveVideo_Application1_applicationComplete"
            }
         });
         super();
         mx_internal::_document = this;
         this.layout = "absolute";
         this.addEventListener("creationComplete",this.___liveVideo_Application1_creationComplete);
         this.addEventListener("preinitialize",this.___liveVideo_Application1_preinitialize);
         this.addEventListener("applicationComplete",this.___liveVideo_Application1_applicationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         mx_internal::_liveVideo_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function getScreenResolution() : void
      {
         this.m_screenHeight = Capabilities.screenResolutionY;
         this.m_screenWidth = Capabilities.screenResolutionX;
      }
      
      private function initDeviceInfo() : void
      {
         this.getDeviceInfo();
         this.getScreenResolution();
         this.m_iLanguageId = 1;
         var _loc1_:Object = ExternalInterface.call("getLanguageId");
         if(null != _loc1_)
         {
            this.m_iLanguageId = int(_loc1_);
         }
         this.m_objLanguageXMLManager = new LanguageXMLManager(LanguageConst.File_Name_RightMenu,this.m_iLanguageId);
         this.m_objLanguageXMLManager.loaderXML();
         this.m_iVideoUseType = 1;
         this.m_iColorFlag = 0;
         this.m_uScreenNum = 1;
         this.m_uScreenLayoutMode = 1;
         _loc1_ = ExternalInterface.call("getVideoUseType");
         if(_loc1_ != null)
         {
            this.m_iVideoUseType = int(_loc1_.videoUseType);
            this.m_iColorFlag = int(_loc1_.colorFlag);
         }
      }
      
      private function getDeviceInfo() : void
      {
         var _loc1_:Date = new Date();
         var _loc2_:Object = ExternalInterface.call("getDeviceInfo");
         if(_loc2_ == null)
         {
            return;
         }
         this.m_objDeviceInfoEx = new DeviceInfoEx();
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeMultiByte(_loc2_.deviceId,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         this.m_objDeviceInfoEx.DeviceID = _loc3_;
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(_loc2_.deviceName,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         this.m_objDeviceInfoEx.DeviceName = _loc3_;
         this.m_objDeviceInfoEx.setDeviceType(DeviceType.IPCAMERA);
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(_loc2_.userPWD,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         this.m_objDeviceInfoEx.Password = _loc3_;
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(_loc2_.userName,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         this.m_objDeviceInfoEx.UserID = _loc3_;
         this.m_objDeviceInfoEx.getDeviceAddr().Port = int(_loc2_.serverPort);
         if(this.m_objDeviceInfoEx.getDeviceAddr().Port < 0 || this.m_objDeviceInfoEx.getDeviceAddr().Port > 65535)
         {
         }
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(_loc2_.serverHost,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         this.m_objDeviceInfoEx.getDeviceAddr().setIP(_loc3_);
         if(_loc2_.serverHost.length == 0)
         {
            return;
         }
         this.m_iCameraId = _loc2_.cameraId;
      }
      
      protected function application_applicationCompleteHandler() : void
      {
         this.init();
         if(this.m_objPlayerUI != null)
         {
            this.m_objPlayerUI.playVideo();
         }
      }
      
      protected function application_creationCompleteHandler() : void
      {
      }
      
      private function init() : void
      {
         this.createScreenWall();
         this.initScreen();
         this.initPlayer();
      }
      
      private function initPlayer() : void
      {
         this.m_objClass = liveVideo;
         if(this.m_objScreen == null)
         {
            return;
         }
         this.m_objPlayerUI = new PlayerUI(this.m_objDeviceInfoEx,this.m_objScreen,this,this.m_objLanguageXMLManager,this.m_screenWidth,this.m_screenHeight);
         if(this.m_objScreen != null)
         {
            this.m_objScreen.addElement(this.m_objPlayerUI);
         }
         this.m_objPlayerUI.setCameraId(this.m_iCameraId);
         this.m_objPlayerUI.width = this.m_objScreen.width - 2;
         this.m_objPlayerUI.height = this.m_objScreen.height - 2;
         this.m_objPlayerUI.setLanguageId(this.m_iLanguageId);
         this.m_objPlayerUI.setClass(this.m_objClass);
         this.m_objPlayerUI.setColorFlag(this.m_iColorFlag);
         this.m_objPlayerUI.setVideoUseType(this.m_iVideoUseType);
         this.m_objPlayerUI.initComponent();
         this.m_objScreen.useFlag = true;
      }
      
      private function createScreenWall() : void
      {
         if(null != this.m_objScreenWall)
         {
            this.m_objScreenWall.removeAllScreen();
            this.m_objScreenWall = null;
         }
         if(this.m_iVideoUseType == 1)
         {
            this.m_objScreenWall = new ScreenWall(this.width,this.height,this,this.screenFullWall);
         }
         else
         {
            this.m_objScreenWall = new ScreenWall(this.width,this.height,this,null);
         }
         this.m_objScreenWall.screenNum = this.m_uScreenNum;
         this.m_objScreenWall.layoutMode = this.m_uScreenLayoutMode;
         this.m_objScreenWall.createScreens();
      }
      
      public function initScreen() : void
      {
         if(this.m_objScreenWall == null)
         {
            return;
         }
         this.m_objScreen = this.m_objScreenWall.getScreen(this.m_objScreenWall.getScreenIndex());
      }
      
      private function screenFullWall(param1:int, param2:Boolean) : void
      {
         if(this.m_objPlayerUI != null)
         {
         }
      }
      
      private function play() : void
      {
         this.initPlayer();
         if(this.m_objPlayerUI != null)
         {
            this.m_objPlayerUI.playVideo();
         }
      }
      
      public function removePlayer(param1:PlayerUI) : void
      {
         this.m_objPlayerUI = null;
      }
      
      public function ___liveVideo_Application1_creationComplete(param1:FlexEvent) : void
      {
         this.application_creationCompleteHandler();
      }
      
      public function ___liveVideo_Application1_preinitialize(param1:FlexEvent) : void
      {
         this.initDeviceInfo();
      }
      
      public function ___liveVideo_Application1_applicationComplete(param1:FlexEvent) : void
      {
         this.application_applicationCompleteHandler();
      }
      
      mx_internal function _liveVideo_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_liveVideo_StylesInit_done)
         {
            return;
         }
         mx_internal::_liveVideo_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","sensorConfig");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".sensorConfig");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontFamily = "Arial";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","Slider");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".Slider");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelOffset = 36;
               this.fontFamily = "Arial";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","WidgetNameLab");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".WidgetNameLab");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.textAlign = "right";
               this.fontFamily = "Arial";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","TabNavigate");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".TabNavigate");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusAlpha = 1;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","VideoContainer");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".VideoContainer");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 8224125;
               this.backgroundColor = 0;
               this.borderVisible = true;
               this.border = 1;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ToolContainer");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".ToolContainer");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4211525;
               this.color = 16777215;
               this.backgroundColor = 4211525;
               this.borderVisible = true;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","SelectedVideoContainer");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".SelectedVideoContainer");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 3521752;
               this.backgroundColor = 0;
               this.borderVisible = true;
               this.border = 1;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","VideoConnectTipLab");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".VideoConnectTipLab");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 4434144;
               this.textAlign = "center";
               this.fontFamily = "NSimSun,Arial,Helvetica";
               this.verticalAlign = "middle";
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","Playerdd");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".Playerdd");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 65280;
               this.backgroundColor = 16711680;
               this.borderVisible = true;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","TipLabWithBackgroundColor");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".TipLabWithBackgroundColor");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundColor = 0;
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "NSimSun,Arial,Helvetica";
               this.verticalAlign = "middle";
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","MaskScreen");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".MaskScreen");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 0;
               this.backgroundColor = 0;
               this.border = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ProcessBar");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".ProcessBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 4211525;
               this.backgroundColor = 4211525;
               this.border = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","RecordStateLabel");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".RecordStateLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 59392;
               this.textAlign = "center";
               this.fontFamily = "NSimSun,Arial,Helvetica";
               this.fontSize = 15;
               this.border = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","BackgroundLabel");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".BackgroundLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundColor = 6250335;
               this.border = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ProcessLabel");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".ProcessLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundColor = 15724527;
               this.border = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","deviceName");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".deviceName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16448250;
               this.textAlign = "left";
               this.fontSize = 13;
               this.verticalAlign = "middle";
               this.paddingLeft = 5;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("global",conditions,selector);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.modalTransparency = 0;
               this.modalTransparencyBlur = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("mx.controls.Alert",conditions,selector);
         style = styleManager.getStyleDeclaration("mx.controls.Alert");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.modalTransparency = 0;
            };
         }
         styleManager.initProtoChainRoots();
      }
   }
}
