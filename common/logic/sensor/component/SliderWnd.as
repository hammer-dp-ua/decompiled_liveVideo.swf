package common.logic.sensor.component
{
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.styleparser.WndConfig;
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   import flash.geom.Rectangle;
   import mx.controls.sliderClasses.Slider;
   import mx.core.UIComponent;
   import mx.events.SliderEvent;
   import spark.components.Label;
   
   public class SliderWnd extends Wnd
   {
       
      
      private var m_objSlider:Slider;
      
      private var m_objValueLab:Label;
      
      private var m_iRealTime:int;
      
      private var m_nLastMouseMoveTime:Number;
      
      private var m_bIsPress:Boolean;
      
      private var m_iOldValue:int;
      
      public function SliderWnd()
      {
         super();
         this.m_bIsPress = false;
         this.m_nLastMouseMoveTime = 0;
         this.m_iOldValue = 0;
      }
      
      override public function getRealWnd() : UIComponent
      {
         return this.m_objSlider;
      }
      
      override public function setToolTip(param1:String) : void
      {
         this.m_objSlider.toolTip = param1;
      }
      
      override public function UpdateValue(param1:Map) : int
      {
         var _loc2_:KeyValuePair = param1.find(int(this.m_objSlider.id));
         if(null != _loc2_)
         {
            this.m_objSlider.value = _loc2_.Value;
            this.m_objValueLab.text = new String(_loc2_.Value);
         }
         return 0;
      }
      
      override public function EnableWindow(param1:Boolean) : void
      {
         this.m_objSlider.enabled = param1;
         this.m_objValueLab.enabled = param1;
         this.getWidgetNameLab().enabled = param1;
      }
      
      override public function ShowWindow(param1:Boolean) : void
      {
         this.m_objSlider.visible = param1;
         this.m_objValueLab.visible = param1;
         this.getWidgetNameLab().visible = param1;
      }
      
      override public function setValue(param1:int) : void
      {
         this.m_objSlider.value = param1;
         this.m_objValueLab.text = param1.toString();
         this.m_iOldValue = param1;
      }
      
      override public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         var _loc3_:Rectangle = new Rectangle();
         if(!getPosition(param1,param2,_loc3_))
         {
            throw new Error("slider position failed");
         }
         var _loc4_:String = param2.getProperty(Wnd_Property.WND_ID);
         if(null == _loc4_)
         {
            throw new Error("slider config has no id");
         }
         var _loc5_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_MIN);
         if(null == _loc4_)
         {
            throw new Error("slider has no min property");
         }
         var _loc6_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_MAX);
         if(null == _loc4_)
         {
            throw new Error("slider has no max property");
         }
         var _loc7_:int = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_VALUE);
         if(null == _loc4_)
         {
            throw new Error("slider has no value property");
         }
         var _loc8_:int = int(_loc4_);
         var _loc9_:Array = new Array();
         _loc9_.push(_loc6_);
         _loc9_.push(_loc7_);
         this.m_objSlider = new Slider();
         this.m_objSlider.id = _loc5_.toString();
         this.m_objSlider.minimum = _loc6_;
         this.m_objSlider.maximum = _loc7_;
         this.m_objSlider.x = _loc3_.x - param1.getRealWnd().x;
         this.m_objSlider.y = _loc3_.y + 4 - param1.getRealWnd().y;
         this.m_objSlider.width = _loc3_.width;
         this.m_objSlider.height = _loc3_.height;
         this.m_objSlider.labels = _loc9_;
         this.m_objSlider.value = _loc8_;
         this.m_iOldValue = _loc8_;
         this.m_objSlider.snapInterval = 1;
         this.m_objSlider.addEventListener(SliderEvent.THUMB_RELEASE,this.SliderRelease_EventHandler);
         this.m_objSlider.addEventListener(SliderEvent.CHANGE,this.SliderChange_EventHandler);
         this.m_objSlider.addEventListener(SliderEvent.THUMB_PRESS,this.SliderPress_EventHandler);
         this.m_objSlider.addEventListener(SliderEvent.THUMB_DRAG,this.Drag_EventHandler);
         this.m_iRealTime = int(param2.getProperty(Wnd_Property.WND_REALTIME));
         this.m_objSlider.styleName = "Slider";
         setTip(this,_loc5_);
         if(!createWidgetName(param1,param2))
         {
            throw new Error("slider create widget name failed");
         }
         this.m_objValueLab = new Label();
         this.m_objValueLab.text = this.m_objSlider.value.toString();
         this.m_objValueLab.id = (_loc5_ + 10000).toString();
         this.m_objValueLab.x = this.m_objSlider.x + this.m_objSlider.width + 7 - param1.getRealWnd().x;
         this.m_objValueLab.y = _loc3_.y + 4 - param1.getRealWnd().y;
         this.m_objValueLab.width = 25;
         param1.addElementAt(this.m_objValueLab,param1.BottomChildNumber);
         param1.BottomChildNumber = param1.BottomChildNumber + 1;
         param1.addElementAt(this.m_objSlider,param1.BottomChildNumber);
         param1.BottomChildNumber = param1.BottomChildNumber + 1;
         return 0;
      }
      
      public function Drag_EventHandler(param1:SliderEvent) : void
      {
         if(!this.m_bIsPress)
         {
            return;
         }
         var _loc2_:Date = new Date();
         var _loc3_:Number = _loc2_.time;
         if(_loc3_ - this.m_nLastMouseMoveTime < 100)
         {
            return;
         }
         this.m_nLastMouseMoveTime = _loc3_;
         this.common_RealHandler(param1);
      }
      
      public function SliderPress_EventHandler(param1:SliderEvent) : void
      {
         this.m_bIsPress = true;
      }
      
      private function common_RealHandler(param1:SliderEvent) : void
      {
         if(this.m_iRealTime != 1)
         {
            return;
         }
         this.m_iOldValue = int(this.m_objValueLab.text);
         this.getParent().RealTime_Handler(param1.value,this.m_iOldValue,int(this.m_objSlider.id));
         this.m_objValueLab.text = param1.value.toString();
      }
      
      public function SliderChange_EventHandler(param1:SliderEvent) : void
      {
         this.common_RealHandler(param1);
      }
      
      public function SliderRelease_EventHandler(param1:SliderEvent) : void
      {
         if(!this.m_bIsPress)
         {
            return;
         }
         this.common_RealHandler(param1);
         this.m_bIsPress = false;
      }
      
      override public function SaveValue(param1:Map) : int
      {
         if(this.m_objSlider.enabled)
         {
            param1.push(int(this.m_objSlider.id),int(this.m_objSlider.value));
         }
         return 0;
      }
   }
}
