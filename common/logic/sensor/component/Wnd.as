package common.logic.sensor.component
{
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.languageparser.SensorLanguageConfig;
   import common.logic.sensor.styleparser.WndConfig;
   import common.logic.share.CommonConst;
   import common.service.util.Map;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import mx.core.UIComponent;
   import spark.components.Label;
   
   public class Wnd
   {
       
      
      protected var m_iId:int;
      
      protected var m_objSensorLanguageConfig:SensorLanguageConfig;
      
      protected var m_objLogicParentWnd:Wnd;
      
      protected var m_objUIParentWnd:Wnd;
      
      protected var m_objChildWndList:Vector.<Wnd>;
      
      private var m_objWidgetNameLab:Label;
      
      public function Wnd()
      {
         super();
         this.m_objChildWndList = new Vector.<Wnd>();
      }
      
      public function setSensorLanguageConfig(param1:SensorLanguageConfig) : void
      {
         this.m_objSensorLanguageConfig = param1;
      }
      
      public function getWidgetNameLab() : Label
      {
         return this.m_objWidgetNameLab;
      }
      
      public function setLogicParentWnd(param1:Wnd) : void
      {
         this.m_objLogicParentWnd = param1;
      }
      
      public function setWndName(param1:String) : void
      {
      }
      
      public function Create(param1:Wnd, param2:WndConfig) : int
      {
         var _loc7_:String = null;
         var _loc8_:Wnd = null;
         this.m_iId = int(param2.getProperty(Wnd_Property.WND_ID));
         var _loc3_:int = this.CreateWnd(param1,param2);
         if(_loc3_ != 0)
         {
            return _loc3_;
         }
         var _loc4_:WndConfig = null;
         var _loc5_:Vector.<WndConfig> = param2.getChildWndList();
         var _loc6_:int = _loc5_.length - 1;
         while(_loc6_ >= 0)
         {
            _loc4_ = _loc5_[_loc6_.toString()];
            _loc7_ = _loc4_.getWndType();
            if(null != _loc7_)
            {
               _loc8_ = Wnd(WndFactory.create(_loc7_));
               _loc8_.setSensorLanguageConfig(this.m_objSensorLanguageConfig);
               _loc8_.setLogicParentWnd(this);
               _loc3_ = _loc8_.Create(this,_loc4_);
               if(_loc3_ != 0)
               {
                  return _loc3_;
               }
               this.addWnd(_loc8_);
            }
            _loc6_--;
         }
         this.m_objUIParentWnd = param1;
         return 0;
      }
      
      public function Save(param1:Map) : int
      {
         var _loc3_:* = null;
         var _loc4_:Wnd = null;
         var _loc2_:int = this.SaveValue(param1);
         if(_loc2_ != 0)
         {
            return -1;
         }
         for(_loc3_ in this.m_objChildWndList)
         {
            _loc4_ = this.m_objChildWndList[_loc3_];
            _loc2_ = _loc4_.Save(param1);
            if(_loc2_ != 0)
            {
               return -1;
            }
         }
         return 0;
      }
      
      public function Update(param1:Map) : int
      {
         var _loc3_:* = null;
         var _loc4_:Wnd = null;
         var _loc2_:int = this.UpdateValue(param1);
         if(_loc2_ != 0)
         {
            return -1;
         }
         for(_loc3_ in this.m_objChildWndList)
         {
            _loc4_ = this.m_objChildWndList[_loc3_];
            _loc2_ = _loc4_.Update(param1);
            if(_loc2_ != 0)
            {
               return -1;
            }
         }
         return 0;
      }
      
      public function GetWndId() : int
      {
         return this.m_iId;
      }
      
      public function adjustState() : void
      {
         var _loc1_:* = null;
         var _loc2_:Wnd = null;
         this.adjustWndState();
         for(_loc1_ in this.m_objChildWndList)
         {
            _loc2_ = this.m_objChildWndList[_loc1_];
            _loc2_.adjustState();
         }
      }
      
      public function EnableWindow(param1:Boolean) : void
      {
      }
      
      public function ShowWindow(param1:Boolean) : void
      {
      }
      
      public function adjustWndState() : void
      {
      }
      
      public function enableWindowList(param1:Vector.<int>, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Wnd = null;
         if(this.m_objLogicParentWnd)
         {
            this.m_objLogicParentWnd.enableWindowList(param1,param2);
         }
         else
         {
            for(_loc3_ in this.m_objChildWndList)
            {
               for(_loc4_ in param1)
               {
                  _loc5_ = this.m_objChildWndList[_loc3_].getAppointWnd(param1[_loc4_]);
                  if(null != _loc5_)
                  {
                     _loc5_.EnableWindow(param2);
                     _loc5_.adjustWndState();
                  }
               }
            }
         }
      }
      
      public function showWindowList(param1:Vector.<int>, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Wnd = null;
         if(this.m_objLogicParentWnd)
         {
            this.m_objLogicParentWnd.showWindowList(param1,param2);
         }
         else
         {
            for(_loc3_ in this.m_objChildWndList)
            {
               for(_loc4_ in param1)
               {
                  _loc5_ = this.m_objChildWndList[_loc3_].getAppointWnd(param1[_loc4_]);
                  if(null != _loc5_)
                  {
                     _loc5_.ShowWindow(param2);
                     _loc5_.adjustWndState();
                  }
               }
            }
         }
      }
      
      public function getAppointWnd(param1:int) : Wnd
      {
         var _loc2_:* = null;
         var _loc3_:Wnd = null;
         for(_loc2_ in this.m_objChildWndList)
         {
            if(this.m_objChildWndList[_loc2_].GetWndId() == param1)
            {
               return this.m_objChildWndList[_loc2_];
            }
            _loc3_ = this.m_objChildWndList[_loc2_].getAppointWnd(param1);
            if(null != _loc3_)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         return 0;
      }
      
      public function SaveValue(param1:Map) : int
      {
         return 0;
      }
      
      public function UpdateValue(param1:Map) : int
      {
         return 0;
      }
      
      public function getRealWnd() : UIComponent
      {
         return null;
      }
      
      protected function addWnd(param1:Wnd) : void
      {
         this.m_objChildWndList.push(param1);
      }
      
      protected function getPosition(param1:Wnd, param2:WndConfig, param3:Rectangle) : Boolean
      {
         var _loc4_:String = param2.getProperty(Wnd_Property.WND_X);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc5_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_Y);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc6_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_WIDTH);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc7_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_HEIGHT);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc8_:int = int(_loc4_);
         if(this.isOutOfRange(param1,_loc5_,_loc5_ + _loc7_,_loc6_,_loc6_ + _loc8_))
         {
            return false;
         }
         param3.x = _loc5_;
         param3.y = _loc6_;
         param3.width = _loc7_;
         param3.height = _loc8_;
         return true;
      }
      
      public function addElementAt(param1:UIComponent, param2:int) : void
      {
      }
      
      public function addElement(param1:UIComponent) : void
      {
      }
      
      public function set BottomChildNumber(param1:int) : void
      {
      }
      
      public function get BottomChildNumber() : int
      {
         return 0;
      }
      
      protected function isOutOfRange(param1:Wnd, param2:int, param3:int, param4:int, param5:int) : Boolean
      {
         if(param2 < 0)
         {
            return true;
         }
         if(param4 < 0)
         {
            return true;
         }
         return false;
      }
      
      protected function createWidgetName(param1:Wnd, param2:WndConfig) : Boolean
      {
         var _loc3_:String = this.getWndNameInfo(param1,param2);
         if(null == _loc3_)
         {
            return false;
         }
         var _loc4_:String = param2.getProperty(Wnd_Property.WND_X);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc5_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_Y);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc6_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_ID);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc7_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_KEY);
         if(null == _loc4_)
         {
            return false;
         }
         var _loc8_:int = int(_loc4_);
         var _loc9_:ByteArray = new ByteArray();
         _loc9_.writeMultiByte(_loc3_,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc9_.position = 0;
         var _loc10_:int = _loc5_ - 2;
         var _loc11_:int = 0;
         var _loc12_:int = _loc6_ + 4;
         var _loc13_:int = 26;
         this.m_objWidgetNameLab = new Label();
         this.m_objWidgetNameLab.text = _loc3_;
         this.m_objWidgetNameLab.id = (_loc7_ + 5000).toString();
         this.m_objWidgetNameLab.styleName = "WidgetNameLab";
         this.m_objWidgetNameLab.x = _loc11_ - param1.getRealWnd().x;
         this.m_objWidgetNameLab.y = _loc12_ - param1.getRealWnd().y;
         this.m_objWidgetNameLab.width = _loc10_;
         this.m_objWidgetNameLab.height = _loc13_;
         param1.addElementAt(this.m_objWidgetNameLab,param1.BottomChildNumber);
         param1.BottomChildNumber = param1.BottomChildNumber + 1;
         return true;
      }
      
      protected function getWndNameInfo(param1:Wnd, param2:WndConfig) : String
      {
         var _loc3_:String = param2.getProperty(Wnd_Property.WND_KEY);
         var _loc4_:int = int(_loc3_);
         if(null == _loc3_)
         {
            return null;
         }
         var _loc5_:String = this.m_objSensorLanguageConfig.getWndName(_loc4_);
         if(null == _loc5_)
         {
            return null;
         }
         return _loc5_;
      }
      
      public function getWndName(param1:WndConfig) : String
      {
         var _loc2_:String = param1.getProperty(Wnd_Property.WND_KEY);
         if(null == _loc2_)
         {
            return null;
         }
         var _loc3_:int = int(_loc2_);
         var _loc4_:String = this.m_objSensorLanguageConfig.getWndName(_loc3_);
         if(null == _loc4_)
         {
            return null;
         }
         return _loc4_;
      }
      
      public function setTip(param1:Wnd, param2:int) : void
      {
         var _loc3_:String = this.m_objSensorLanguageConfig.getHelpInfo(param2);
         if(null != _loc3_)
         {
            param1.setToolTip(_loc3_);
         }
      }
      
      public function RealTime_Handler(param1:int, param2:int, param3:int) : void
      {
      }
      
      protected function getParent() : Wnd
      {
         return this.m_objLogicParentWnd;
      }
      
      public function setToolTip(param1:String) : void
      {
      }
      
      public function setValue(param1:int) : void
      {
      }
   }
}
