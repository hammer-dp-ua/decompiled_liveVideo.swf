package common.logic.sensor.component
{
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.styleparser.WndConfig;
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   import flash.geom.Rectangle;
   import mx.collections.ArrayList;
   import spark.components.ComboBox;
   import spark.events.IndexChangeEvent;
   
   public class ComboBoxWnd extends Wnd
   {
       
      
      private var m_objComboBox:ComboBox;
      
      private var m_iRealTime:int;
      
      private var m_iOldValue:int;
      
      public function ComboBoxWnd()
      {
         super();
      }
      
      override public function setToolTip(param1:String) : void
      {
         this.m_objComboBox.toolTip = param1;
      }
      
      override public function setValue(param1:int) : void
      {
         this.m_objComboBox.selectedItem.data = param1;
         this.m_iOldValue = param1;
      }
      
      override public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         var _loc10_:Object = null;
         var _loc11_:WndConfig = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc3_:Rectangle = new Rectangle();
         if(!getPosition(param1,param2,_loc3_))
         {
            throw new Error("combobox position failed");
         }
         var _loc4_:String = param2.getProperty(Wnd_Property.WND_ID);
         if(null == _loc4_)
         {
            throw new Error("combobox config has no id");
         }
         var _loc5_:int = int(_loc4_);
         this.m_objComboBox = new ComboBox();
         this.m_objComboBox.id = _loc5_.toString();
         this.m_objComboBox.x = _loc3_.x - param1.getRealWnd().x;
         this.m_objComboBox.y = _loc3_.y - param1.getRealWnd().y;
         this.m_objComboBox.width = _loc3_.width;
         this.m_objComboBox.styleName = "sensorConfig";
         setTip(this,_loc5_);
         if(!createWidgetName(param1,param2))
         {
            throw new Error("combobox create widget name failed");
         }
         _loc4_ = param2.getProperty(Wnd_Property.WND_VALUE);
         if(null == _loc4_)
         {
            throw new Error("combobox has no property id");
         }
         var _loc6_:int = int(_loc4_);
         var _loc7_:ArrayList = new ArrayList();
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < param2.getChildSize())
         {
            _loc10_ = new Object();
            _loc11_ = param2.getAppointedChild(_loc9_);
            if(null == _loc11_)
            {
               throw new Error("combobox child error");
            }
            _loc4_ = _loc11_.getProperty(Wnd_Property.WND_INDEX);
            if(null == _loc4_)
            {
               throw new Error("comboboxItem has no property index");
            }
            _loc12_ = int(_loc4_);
            _loc10_.data = _loc12_;
            _loc13_ = getWndName(_loc11_);
            if(null == _loc13_)
            {
               throw new Error("comboboxItem has no name");
            }
            if(_loc6_ == _loc12_)
            {
               _loc8_ = _loc9_;
            }
            _loc10_.label = _loc13_;
            _loc7_.addItem(_loc10_);
            _loc9_++;
         }
         this.m_objComboBox.dataProvider = _loc7_;
         this.m_objComboBox.selectedIndex = _loc8_;
         this.m_iOldValue = _loc8_;
         this.m_objComboBox.openOnInput = false;
         this.m_objComboBox.addEventListener(IndexChangeEvent.CHANGE,this.ChangeSelectedValue_EventHandler);
         this.m_iRealTime = int(param2.getProperty(Wnd_Property.WND_REALTIME));
         param1.addElementAt(this.m_objComboBox,param1.BottomChildNumber);
         param1.BottomChildNumber = param1.BottomChildNumber + 1;
         return 0;
      }
      
      public function ChangeSelectedValue_EventHandler(param1:IndexChangeEvent) : void
      {
         if(this.m_iRealTime != 1)
         {
            return;
         }
         this.adjustWndState();
         this.getParent().RealTime_Handler(this.m_objComboBox.selectedItem.data,this.m_iOldValue,int(this.m_objComboBox.id));
         this.m_iOldValue = this.m_objComboBox.selectedItem.data;
      }
      
      override public function EnableWindow(param1:Boolean) : void
      {
         this.m_objComboBox.enabled = param1;
         this.getWidgetNameLab().enabled = param1;
      }
      
      override public function ShowWindow(param1:Boolean) : void
      {
         this.m_objComboBox.visible = param1;
         this.getWidgetNameLab().visible = param1;
      }
      
      override public function UpdateValue(param1:Map) : int
      {
         var _loc4_:int = 0;
         var _loc5_:ComboBoxItemWnd = null;
         var _loc2_:KeyValuePair = param1.find(int(this.m_objComboBox.id));
         var _loc3_:uint = 0;
         if(null != _loc2_)
         {
            _loc4_ = m_objChildWndList.length - 1;
            while(_loc4_ >= 0)
            {
               _loc5_ = ComboBoxItemWnd(m_objChildWndList[_loc4_.toString()]);
               if(_loc2_.Value == _loc5_.getIndex())
               {
                  this.m_objComboBox.selectedIndex = _loc3_;
                  break;
               }
               _loc3_++;
               _loc4_--;
            }
         }
         return 0;
      }
      
      override public function adjustWndState() : void
      {
         var _loc1_:* = null;
         var _loc2_:ComboBoxItemWnd = null;
         var _loc3_:Vector.<int> = null;
         var _loc4_:Vector.<int> = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:* = null;
         var _loc8_:ComboBoxItemWnd = null;
         var _loc9_:String = null;
         for(_loc1_ in m_objChildWndList)
         {
            _loc2_ = ComboBoxItemWnd(m_objChildWndList[_loc1_]);
            _loc3_ = _loc2_.getEnableWndList();
            _loc4_ = _loc2_.getShowWndList();
            enableWindowList(_loc3_,false);
            showWindowList(_loc4_,false);
         }
         if(this.m_objComboBox.enabled)
         {
            _loc5_ = this.m_objComboBox.selectedItem.data;
            if(_loc5_ < 0)
            {
               _loc5_ = 0;
            }
            _loc6_ = this.m_objComboBox.selectedItem.label;
            for(_loc7_ in m_objChildWndList)
            {
               _loc8_ = ComboBoxItemWnd(m_objChildWndList[_loc7_]);
               _loc9_ = _loc8_.WndName;
               if(_loc6_ == _loc9_)
               {
                  _loc3_ = _loc8_.getEnableWndList();
                  _loc4_ = _loc8_.getShowWndList();
                  enableWindowList(_loc3_,true);
                  showWindowList(_loc4_,true);
               }
            }
         }
      }
      
      override public function SaveValue(param1:Map) : int
      {
         var _loc2_:* = null;
         var _loc3_:ComboBoxItemWnd = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:String = null;
         for(_loc2_ in m_objChildWndList)
         {
            _loc3_ = ComboBoxItemWnd(m_objChildWndList[_loc2_]);
            _loc4_ = this.m_objComboBox.selectedItem.data;
            if(_loc4_ < 0)
            {
               _loc4_ = 0;
            }
            _loc5_ = this.m_objComboBox.selectedItem.label;
            _loc6_ = _loc3_.WndName;
            if(_loc5_ == _loc6_)
            {
               if(this.m_objComboBox.enabled)
               {
                  param1.push(int(this.m_objComboBox.id),_loc3_.getIndex());
                  break;
               }
            }
         }
         return 0;
      }
   }
}
