package common.sdk.sensor
{
   import common.logic.includes.GeneralError;
   import common.logic.sensor.commonparser.SensorCommonConfig;
   import common.logic.sensor.commonparser.SensorCommonConfigParser;
   import common.logic.sensor.component.NavigatorContentWnd;
   import common.logic.sensor.component.Wnd;
   import common.logic.sensor.consts.Button_Position;
   import common.logic.sensor.consts.SensorUIData;
   import common.logic.sensor.consts.System_Button;
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.consts.Wnd_Type;
   import common.logic.sensor.languageparser.SensorLanguageConfig;
   import common.logic.sensor.languageparser.SensorLanguageConfigParser;
   import common.logic.sensor.styleparser.SensorStyleConfigParser;
   import common.logic.sensor.styleparser.WndConfig;
   import common.logic.sensor.util.SensorTool;
   import common.sdk.LanguageXMLManager;
   import common.service.SNSocket.DeviceInfoEx;
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.xml.XMLDocument;
   import mx.containers.TabNavigator;
   import mx.controls.Alert;
   import mx.controls.Button;
   import mx.events.CloseEvent;
   import mx.managers.PopUpManager;
   import spark.components.TitleWindow;
   
   public class RemoteSensorUI extends Wnd
   {
       
      
      private var m_bIsReceive:Boolean;
      
      private var m_objUI:Object;
      
      private var m_objSensorStyleConfigParser:SensorStyleConfigParser;
      
      private var m_objSensorCommonConfigParser:SensorCommonConfigParser;
      
      private var m_objSensorLanguageConfigParser:SensorLanguageConfigParser;
      
      private var m_objWndConfig:WndConfig;
      
      private var m_objSensorCommonConfigList:Vector.<SensorCommonConfig>;
      
      private var m_objSensorLanguageConfigCur:SensorLanguageConfig;
      
      private var m_objTabNavigator:TabNavigator;
      
      private var m_objTitleWindow:TitleWindow;
      
      private var m_objRemoteSensorControl:RemoteSensorControl;
      
      private var m_objButtonSave:Button;
      
      private var m_objButtonforCancel:Button;
      
      private var m_objButtonforRetSet:Button;
      
      private var m_objButtonforRestore:Button;
      
      private var m_strLastSaveParameters:String;
      
      private var m_iWidth:int;
      
      private var m_iHeight:int;
      
      private var m_iLanguageId:int;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_bFullScrFlag:Boolean;
      
      private var m_funCloseFlagFunction:Function;
      
      private var m_objClass:Class;
      
      private var m_objLanguageXMLManager:LanguageXMLManager;
      
      private var bExitFlag:Boolean = false;
      
      public function RemoteSensorUI(param1:Object, param2:Class, param3:DeviceInfoEx, param4:int, param5:LanguageXMLManager)
      {
         super();
         this.m_objSensorStyleConfigParser = new SensorStyleConfigParser();
         this.m_objSensorCommonConfigParser = new SensorCommonConfigParser();
         this.m_objSensorLanguageConfigParser = new SensorLanguageConfigParser();
         this.m_objWndConfig = new WndConfig();
         this.m_objUI = param2(param1);
         this.m_objDeviceInfoEx = param3;
         this.m_objRemoteSensorControl = new RemoteSensorControl(this.m_objDeviceInfoEx);
         this.m_objSensorCommonConfigList = new Vector.<SensorCommonConfig>();
         this.m_objSensorLanguageConfigCur = new SensorLanguageConfig();
         this.m_strLastSaveParameters = "";
         this.m_objClass = param2;
         this.m_iLanguageId = param4;
         this.m_objLanguageXMLManager = param5;
      }
      
      public function setFullScrFlag(param1:Boolean) : void
      {
         this.m_bFullScrFlag = param1;
      }
      
      public function setSensorCloseFlagFunction(param1:Function) : void
      {
         this.m_funCloseFlagFunction = param1;
      }
      
      public function preReadSensorUISzie(param1:Function) : void
      {
         this.m_objRemoteSensorControl.getUIStyleConfigString(param1);
      }
      
      public function sendSensorCommand() : void
      {
         this.m_objRemoteSensorControl.create(this.m_iLanguageId,this.createSensorUI,this.createSensorError);
      }
      
      public function setLastSaveParameters(param1:String) : void
      {
         this.m_strLastSaveParameters = param1;
      }
      
      public function getLastSaveParameters() : String
      {
         return this.m_strLastSaveParameters;
      }
      
      private function init() : Boolean
      {
         var _loc1_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         var _loc2_:String = SensorUIData.m_strAllParameter;
         var _loc3_:String = SensorUIData.m_strUIStyle;
         var _loc4_:String = SensorUIData.m_strUICommon;
         var _loc5_:String = SensorUIData.m_strUILanguage;
         this.m_strLastSaveParameters = _loc2_;
         SensorTool.parseSensorParameter(_loc2_,_loc1_);
         var _loc6_:XMLDocument = new XMLDocument();
         if(!this.m_objSensorStyleConfigParser.updateStyleConfigXmlStr(_loc3_,_loc1_,_loc6_))
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("updateStyle").toString());
            return false;
         }
         _loc3_ = _loc6_.toString();
         if(!this.m_objSensorStyleConfigParser.parseStyleConfigXmlStr(_loc3_,this.m_objWndConfig))
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("parseStyleXML").toString());
            return false;
         }
         SensorUIData.m_strAllParameter = _loc3_;
         if(!this.m_objSensorCommonConfigParser.parseCommonConfigXmlStr(_loc4_,this.m_objSensorCommonConfigList))
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("parseCommonXML").toString());
            return false;
         }
         if(!this.m_objSensorLanguageConfigParser.parseLanguageConfigXmlStr(_loc5_,this.m_objSensorLanguageConfigCur))
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("parseLangXML").toString());
            return false;
         }
         setSensorLanguageConfig(this.m_objSensorLanguageConfigCur);
         return true;
      }
      
      private function show() : Boolean
      {
         var _loc6_:Wnd = null;
         var _loc1_:String = this.m_objWndConfig.getWndType();
         if("" == _loc1_)
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("noTabControl").toString());
            return false;
         }
         if(_loc1_ != Wnd_Type.TAB_CONTROL)
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("noTypeControl").toString());
            return false;
         }
         var _loc2_:String = getWndName(this.m_objWndConfig);
         if(null == _loc2_)
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("noTitleName").toString());
            return false;
         }
         var _loc3_:String = this.m_objWndConfig.getProperty(Wnd_Property.WND_WIDTH);
         if(null == _loc3_)
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("noWidth").toString());
            return false;
         }
         this.m_iWidth = int(_loc3_);
         _loc3_ = this.m_objWndConfig.getProperty(Wnd_Property.WND_HEIGHT);
         if(null == _loc3_)
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("noHeight").toString());
            return false;
         }
         this.m_iHeight = int(_loc3_);
         this.m_objTabNavigator = new TabNavigator();
         this.m_objTabNavigator.height = this.m_iHeight - 60;
         this.m_objTabNavigator.width = this.m_iWidth - 40;
         this.m_objTabNavigator.x = 10;
         this.m_objTabNavigator.styleName = "TabNavigate";
         if(!this.m_bFullScrFlag)
         {
            this.m_objUI.addElement(this.m_objTabNavigator);
            this.m_objUI.setTitle(_loc2_);
         }
         else if(this.m_bFullScrFlag)
         {
            this.m_objTitleWindow = new TitleWindow();
            this.m_objTitleWindow.addElement(this.m_objTabNavigator);
            this.m_objTitleWindow.addEventListener(CloseEvent.CLOSE,this.titleWindowClose_ClickHandler);
            this.m_objTitleWindow.title = _loc2_;
            this.m_objTitleWindow.width = this.m_iWidth;
            this.m_objTitleWindow.height = this.m_iHeight;
            this.m_objTitleWindow.x = 400;
            this.m_objTitleWindow.y = 300;
         }
         var _loc4_:int = this.m_objWndConfig.getChildSize();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new NavigatorContentWnd();
            _loc6_.setSensorLanguageConfig(this.m_objSensorLanguageConfigCur);
            _loc6_.setLogicParentWnd(this);
            addWnd(_loc6_);
            this.m_objTabNavigator.addChild(_loc6_.getRealWnd());
            _loc5_++;
         }
         this.onInitDialog();
         return true;
      }
      
      private function onInitDialog() : Boolean
      {
         if(!this.adjustWndStyle())
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("wndStyleailed").toString());
            return false;
         }
         if(!this.initSysButton())
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("sysButtonFailed").toString());
            return false;
         }
         try
         {
            this.initPages();
            if(this.m_bFullScrFlag)
            {
               PopUpManager.addPopUp(this.m_objTitleWindow,this.m_objClass(this.m_objUI),true);
            }
         }
         catch(error:Error)
         {
            Alert.show(error.message);
            return false;
         }
         return true;
      }
      
      protected function adjustWndStyle() : Boolean
      {
         return true;
      }
      
      private function initPages() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:Wnd = null;
         var _loc3_:WndConfig = null;
         var _loc4_:String = null;
         for(_loc1_ in this.m_objChildWndList)
         {
            _loc2_ = m_objChildWndList[_loc1_];
            _loc3_ = this.m_objWndConfig.getAppointedChild(int(_loc1_));
            if(_loc3_ == null)
            {
               throw new Error(this.m_objLanguageXMLManager.getNameById("wndFailed").toString());
            }
            _loc4_ = _loc2_.getWndName(_loc3_);
            if(null == _loc4_)
            {
               throw new Error(this.m_objLanguageXMLManager.getNameById("wndNoName").toString());
            }
            _loc2_.setWndName(_loc4_);
            _loc2_.Create(_loc2_,_loc3_);
         }
         this.m_objTabNavigator.selectedIndex = 0;
         adjustState();
         return true;
      }
      
      private function titleWindowClose_ClickHandler(param1:CloseEvent) : void
      {
         this.exit();
      }
      
      private function initSysButton() : Boolean
      {
         if(!this.CreateSave_Button())
         {
            return false;
         }
         if(!this.CreateRetSet_Button())
         {
            return false;
         }
         if(!this.CreateCancel_Button())
         {
            return false;
         }
         if(!this.CreateRestore_Button())
         {
            return false;
         }
         return true;
      }
      
      public function getSysButtonInfo(param1:String, param2:String) : String
      {
         var _loc3_:* = null;
         var _loc4_:String = null;
         for(_loc3_ in this.m_objSensorCommonConfigList)
         {
            if(param1 == this.m_objSensorCommonConfigList[_loc3_].getType())
            {
               _loc4_ = this.m_objSensorCommonConfigList[_loc3_].getTipInfo(param2);
               if(null == _loc4_)
               {
                  return null;
               }
               return _loc4_;
            }
         }
         return null;
      }
      
      private function CreateSave_Button() : Boolean
      {
         var _loc1_:Rectangle = this.getButtonPosition(Button_Position.BUTTONNUMBER,Button_Position.APPLYBUTTON);
         var _loc2_:String = this.getSysButtonInfo(System_Button.SAVE_BUTTON,System_Button.SYS_BTN_NAME);
         if(null == _loc2_)
         {
            return false;
         }
         this.m_objButtonSave = new Button();
         this.m_objButtonSave.label = _loc2_;
         this.m_objButtonSave.id = System_Button.SAVE_ID.toString();
         this.m_objButtonSave.styleName = "sensorConfig";
         var _loc3_:String = this.getSysButtonInfo(System_Button.SAVE_BUTTON,System_Button.SYS_BTN_HELP);
         if(null != _loc3_)
         {
            this.m_objButtonSave.toolTip = _loc3_;
         }
         this.m_objButtonSave.x = _loc1_.x;
         this.m_objButtonSave.y = _loc1_.y;
         this.m_objButtonSave.width = _loc1_.width;
         this.m_objButtonSave.height = _loc1_.height;
         this.m_objButtonSave.addEventListener(MouseEvent.CLICK,this.Save_ClickHandler);
         if(this.m_bFullScrFlag)
         {
            this.m_objTitleWindow.addElement(this.m_objButtonSave);
         }
         else
         {
            this.m_objUI.addElement(this.m_objButtonSave);
         }
         return true;
      }
      
      private function Save_ClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         Save(_loc2_);
         var _loc3_:String = SensorTool.createSensorParameterString(_loc2_);
         this.m_objRemoteSensorControl.save(this.saveInvoke,this.saveErrorInvoke,_loc3_);
      }
      
      private function getButtonPosition(param1:int, param2:int) : Rectangle
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.m_bFullScrFlag)
         {
            _loc3_ = this.m_objTitleWindow.width * Button_Position.PERCENT / param1 / 9;
            _loc4_ = this.m_objTitleWindow.width * Button_Position.PERCENT / param1 - 2 * _loc3_;
            _loc5_ = this.m_objTitleWindow.width - _loc3_ - _loc3_ * 2 * (param1 - param2) - (param1 - param2) * _loc4_;
            _loc6_ = this.m_objTitleWindow.height - 55;
         }
         else
         {
            _loc3_ = this.m_iWidth * Button_Position.PERCENT / param1 / 9;
            _loc4_ = this.m_iWidth * Button_Position.PERCENT / param1 - 2 * _loc3_;
            _loc5_ = this.m_iWidth - _loc3_ - _loc3_ * 2 * (param1 - param2) - (param1 - param2) * _loc4_;
            _loc6_ = this.m_iHeight - 55;
         }
         var _loc7_:int = _loc5_ - _loc4_;
         var _loc8_:int = 25;
         _loc5_ = _loc4_;
         return new Rectangle(_loc7_,_loc6_,_loc5_,_loc8_);
      }
      
      private function getDefaultPosition() : Rectangle
      {
         var _loc1_:int = 10;
         var _loc2_:int = 160;
         var _loc3_:int = 0;
         if(this.m_bFullScrFlag)
         {
            _loc3_ = this.m_objTitleWindow.height - 55;
         }
         else
         {
            _loc3_ = this.m_iHeight - 55;
         }
         var _loc4_:int = 25;
         return new Rectangle(_loc1_,_loc3_,_loc2_,_loc4_);
      }
      
      private function CreateCancel_Button() : Boolean
      {
         var _loc1_:Rectangle = this.getButtonPosition(Button_Position.BUTTONNUMBER,Button_Position.CANCELBUTTON);
         var _loc2_:String = this.getSysButtonInfo(System_Button.CANCEL_BUTTON,System_Button.SYS_BTN_NAME);
         if(null == _loc2_)
         {
            return false;
         }
         this.m_objButtonforCancel = new Button();
         this.m_objButtonforCancel.label = _loc2_;
         this.m_objButtonforCancel.id = System_Button.CANCEL_ID.toString();
         this.m_objButtonforCancel.styleName = "sensorConfig";
         var _loc3_:String = this.getSysButtonInfo(System_Button.CANCEL_BUTTON,System_Button.SYS_BTN_HELP);
         if(null != _loc3_)
         {
            this.m_objButtonforCancel.toolTip = _loc3_;
         }
         this.m_objButtonforCancel.x = _loc1_.x;
         this.m_objButtonforCancel.y = _loc1_.y;
         this.m_objButtonforCancel.width = _loc1_.width;
         this.m_objButtonforCancel.height = _loc1_.height;
         this.m_objButtonforCancel.addEventListener(MouseEvent.CLICK,this.Cancel_ClickHandler);
         if(this.m_bFullScrFlag)
         {
            this.m_objTitleWindow.addElement(this.m_objButtonforCancel);
         }
         else
         {
            this.m_objUI.addElement(this.m_objButtonforCancel);
         }
         return true;
      }
      
      public function Cancel_ClickHandler(param1:MouseEvent) : void
      {
         this.bExitFlag = true;
         var _loc2_:int = 0;
         while(_loc2_ < m_objChildWndList.length)
         {
            m_objChildWndList.pop();
            _loc2_++;
         }
         this.m_objRemoteSensorControl.closeTCPTransfer();
         if(this.m_bFullScrFlag)
         {
            this.removeSensor(null);
         }
         else
         {
            this.m_objUI.removeElement(this.m_objTabNavigator);
            this.m_objUI.removeElement(this.m_objButtonforCancel);
            this.m_objUI.removeElement(this.m_objButtonforRestore);
            this.m_objUI.removeElement(this.m_objButtonforRetSet);
            this.m_objUI.removeElement(this.m_objButtonSave);
            this.m_objUI.deleteSensorConfigureUI();
         }
      }
      
      public function removeSensor(param1:CloseEvent) : void
      {
         if(this.bExitFlag)
         {
            if(this.m_bFullScrFlag)
            {
               PopUpManager.removePopUp(this.m_objTitleWindow);
               this.m_funCloseFlagFunction.call(null,false);
            }
            else
            {
               ExternalInterface.call("deleteSWF");
            }
            this.m_objRemoteSensorControl.closeTCPTransfer();
         }
      }
      
      private function CreateRetSet_Button() : Boolean
      {
         var _loc1_:Rectangle = this.getButtonPosition(Button_Position.BUTTONNUMBER,Button_Position.REFRESHBUTTON);
         var _loc2_:String = this.getSysButtonInfo(System_Button.RESET_BUTTON,System_Button.SYS_BTN_NAME);
         if(null == _loc2_)
         {
            return false;
         }
         this.m_objButtonforRetSet = new Button();
         this.m_objButtonforRetSet.label = _loc2_;
         this.m_objButtonforRetSet.id = System_Button.RESET_ID.toString();
         this.m_objButtonforRetSet.styleName = "sensorConfig";
         var _loc3_:String = this.getSysButtonInfo(System_Button.RESET_BUTTON,System_Button.SYS_BTN_HELP);
         if(null != _loc3_)
         {
            this.m_objButtonforRetSet.toolTip = _loc3_;
         }
         this.m_objButtonforRetSet.x = _loc1_.x;
         this.m_objButtonforRetSet.y = _loc1_.y;
         this.m_objButtonforRetSet.width = _loc1_.width;
         this.m_objButtonforRetSet.height = _loc1_.height;
         this.m_objButtonforRetSet.addEventListener(MouseEvent.CLICK,this.Reset_ClickHandler);
         if(this.m_bFullScrFlag)
         {
            this.m_objTitleWindow.addElement(this.m_objButtonforRetSet);
         }
         else
         {
            this.m_objUI.addElement(this.m_objButtonforRetSet);
         }
         return true;
      }
      
      private function Reset_ClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = this.m_objRemoteSensorControl.reset(this.resetSuccessInvoke,this.resetFailedInvoke,this.m_strLastSaveParameters);
      }
      
      private function CreateRestore_Button() : Boolean
      {
         var _loc1_:Rectangle = this.getDefaultPosition();
         var _loc2_:String = this.getSysButtonInfo(System_Button.FACTORY_BUTTON,System_Button.SYS_BTN_NAME);
         if(null == _loc2_)
         {
            return false;
         }
         this.m_objButtonforRestore = new Button();
         this.m_objButtonforRestore.label = _loc2_;
         this.m_objButtonforRestore.id = System_Button.FACTORYSETTING_ID.toString();
         this.m_objButtonforRestore.styleName = "sensorConfig";
         var _loc3_:String = this.getSysButtonInfo(System_Button.FACTORY_BUTTON,System_Button.SYS_BTN_HELP);
         if(null != _loc3_)
         {
            this.m_objButtonforRestore.toolTip = _loc3_;
         }
         this.m_objButtonforRestore.x = _loc1_.x;
         this.m_objButtonforRestore.y = _loc1_.y;
         this.m_objButtonforRestore.width = _loc1_.width;
         this.m_objButtonforRestore.height = _loc1_.height;
         this.m_objButtonforRestore.addEventListener(MouseEvent.CLICK,this.Restore_ClickHandler);
         if(this.m_bFullScrFlag)
         {
            this.m_objTitleWindow.addElement(this.m_objButtonforRestore);
         }
         else
         {
            this.m_objUI.addElement(this.m_objButtonforRestore);
         }
         return true;
      }
      
      public function Restore_ClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = this.getSysButtonInfo(System_Button.FACTORY_BUTTON,System_Button.SYS_BTN_TIP);
         Alert.show(_loc2_,"",Alert.YES | Alert.NO,null,this.judgeYesOrNo);
      }
      
      private function judgeYesOrNo(param1:CloseEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.detail == Alert.YES)
         {
            _loc2_ = this.m_objRemoteSensorControl.restore(this.restoreFactorySettingAlert);
            return;
         }
         if(param1.detail == Alert.NO)
         {
            return;
         }
      }
      
      public function createSensorUI(param1:int = 0) : int
      {
         if(!this.init())
         {
            return -1;
         }
         if(!this.show())
         {
            return -1;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function exit() : void
      {
         this.bExitFlag = true;
         var _loc1_:int = this.m_objRemoteSensorControl.getAllParameter(this.compareParameters);
         if(_loc1_ != GeneralError.SN_SUCCESS)
         {
            this.removeSensor(null);
         }
      }
      
      private function updateLastSaveParam(param1:int) : void
      {
         this.setLastSaveParameters(SensorUIData.m_strAllParameter);
      }
      
      private function compareParameters(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(this.m_strLastSaveParameters != SensorUIData.m_strAllParameter)
         {
            _loc2_ = this.getSysButtonInfo(System_Button.CLOSE_BUTTON,System_Button.SYS_BTN_TIP);
            _loc3_ = this.getSysButtonInfo(System_Button.CLOSE_BUTTON,System_Button.SYS_BTN_TITLE);
            Alert.show(_loc2_,_loc3_,Alert.YES | Alert.NO | Alert.CANCEL,null,this.isSaveParameters);
            return;
         }
         this.removeSensor(null);
      }
      
      public function isSaveParameters(param1:CloseEvent) : void
      {
         if(param1.detail == Alert.YES)
         {
            this.Save_ClickHandler(null);
            return;
         }
         if(param1.detail == Alert.NO)
         {
            this.m_objRemoteSensorControl.resetWithoutRefreshUI();
            this.removeSensor(null);
            return;
         }
         if(param1.detail == Alert.CANCEL)
         {
            this.bExitFlag = false;
            return;
         }
      }
      
      override public function RealTime_Handler(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         _loc4_.push(int(param3),int(param1));
         var _loc5_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         _loc5_.push(int(param3),int(param2));
         var _loc6_:String = SensorTool.createSensorParameterString(_loc4_);
         var _loc7_:String = SensorTool.createSensorParameterString(_loc5_);
         this.m_objRemoteSensorControl.realTimeUpdate(_loc6_,_loc7_,this.realSetParameterFail);
      }
      
      public function createSensorError(param1:int) : void
      {
         if(-506 == param1)
         {
            Alert.show(this.m_objLanguageXMLManager.getNameById("noSupportSensor").toString(),"",Alert.OK,null,this.realCreateSensorFail);
         }
      }
      
      public function realCreateSensorFail(param1:CloseEvent) : void
      {
         if(param1.detail == Alert.OK)
         {
            if(!this.m_bFullScrFlag)
            {
               ExternalInterface.call("deleteSWF");
            }
         }
      }
      
      public function realSetParameterFail(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc4_:KeyValuePair = null;
         var _loc5_:int = 0;
         var _loc6_:Wnd = null;
         var _loc2_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         SensorTool.parseSensorParameter(param1,_loc2_);
         for(_loc3_ in _loc2_.getDataMap())
         {
            _loc4_ = _loc2_.getDataMap()[_loc3_];
            _loc5_ = _loc4_.Key;
            _loc6_ = this.getAppointWnd(_loc5_);
            _loc6_.setValue(_loc4_.Value);
         }
         return 0;
      }
      
      public function restoreFactorySettingAlert(param1:int = 0) : int
      {
         var _loc2_:String = this.getSysButtonInfo(System_Button.FACTORY_BUTTON,System_Button.SYS_BTN_SINFO);
         var _loc3_:String = this.getSysButtonInfo(System_Button.FACTORY_BUTTON,System_Button.SYS_BTN_FINFO);
         if(param1 != 0)
         {
            Alert.show(_loc3_,"",Alert.OK);
            return param1;
         }
         var _loc4_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         SensorTool.parseSensorParameter(SensorUIData.m_strAllParameter,_loc4_);
         Update(_loc4_);
         Alert.show(_loc2_,"",Alert.OK);
         adjustState();
         this.m_objRemoteSensorControl.getAllParameter(this.updateLastSaveParam);
         return GeneralError.SN_SUCCESS;
      }
      
      public function saveInvoke(param1:String) : void
      {
         this.setLastSaveParameters(param1);
         var _loc2_:String = this.getSysButtonInfo(System_Button.SAVE_BUTTON,System_Button.SYS_BTN_SINFO);
         Alert.show(_loc2_,"",Alert.OK,null,this.removeSensor);
         if(!this.bExitFlag)
         {
            this.m_objRemoteSensorControl.getAllParameter(this.updateLastSaveParam);
         }
      }
      
      public function saveErrorInvoke() : void
      {
         var _loc1_:String = this.getSysButtonInfo(System_Button.SAVE_BUTTON,System_Button.SYS_BTN_FINFO);
         Alert.show(_loc1_);
         adjustState();
         this.removeSensor(null);
      }
      
      public function resetSuccessInvoke() : void
      {
         var _loc1_:String = this.getSysButtonInfo(System_Button.RESET_BUTTON,System_Button.SYS_BTN_SINFO);
         var _loc2_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         SensorTool.parseSensorParameter(this.getLastSaveParameters(),_loc2_);
         Update(_loc2_);
         Alert.show(_loc1_);
         adjustState();
         this.m_objRemoteSensorControl.getAllParameter(this.updateLastSaveParam);
      }
      
      public function resetFailedInvoke(param1:int) : int
      {
         var _loc2_:String = this.getSysButtonInfo(System_Button.RESET_BUTTON,System_Button.SYS_BTN_FINFO);
         if(param1 != 0)
         {
            Alert.show(_loc2_);
            adjustState();
            return param1;
         }
         var _loc3_:Map = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_INT);
         SensorTool.parseSensorParameter(SensorUIData.m_strAllParameter,_loc3_);
         Update(_loc3_);
         Alert.show(_loc2_);
         adjustState();
         return param1;
      }
   }
}
