package spark.skins.wireframe
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Label;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class ButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      public var _ButtonSkin_Rect1:Rect;
      
      public var _ButtonSkin_Rect2:Rect;
      
      public var _ButtonSkin_Rect3:Rect;
      
      private var _747523688_ButtonSkin_SolidColor1:SolidColor;
      
      private var _2136706608_ButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 22;
         this.minHeight = 22;
         this.mxmlContent = [this._ButtonSkin_Rect1_i(),this._ButtonSkin_Label1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect3_i);
         states = [new State({
            "name":"up",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":10263708
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonSkin_SolidColor1",
               "name":"color",
               "value":14540253
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":10263708
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonSkin_SolidColor1",
               "name":"color",
               "value":14540253
            }),new SetProperty().initializeFromObject({
               "target":"labelDisplay",
               "name":"verticalCenter",
               "value":2
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _ButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 69;
         _loc1_.height = 20;
         _loc1_.radiusX = 2;
         _loc1_.radiusY = 2;
         _loc1_.stroke = this._ButtonSkin_SolidColorStroke1_i();
         _loc1_.fill = this._ButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_ButtonSkin_Rect1");
         this._ButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_Rect1",this._ButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _ButtonSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11119017;
         this._ButtonSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_SolidColorStroke1",this._ButtonSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _ButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12237498;
         this._ButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_SolidColor1",this._ButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _ButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.y = 0;
         _loc1_.height = 4;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._ButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"_ButtonSkin_Rect2");
         this._ButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_Rect2",this._ButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _ButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ButtonSkin_GradientEntry1_c(),this._ButtonSkin_GradientEntry2_c(),this._ButtonSkin_GradientEntry3_c(),this._ButtonSkin_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _ButtonSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.23;
         _loc1_.color = 0;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _ButtonSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.2;
         _loc1_.color = 0;
         _loc1_.ratio = 0.4;
         return _loc1_;
      }
      
      private function _ButtonSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.055;
         _loc1_.color = 0;
         _loc1_.ratio = 0.55;
         return _loc1_;
      }
      
      private function _ButtonSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0;
         _loc1_.color = 0;
         _loc1_.ratio = 0.8;
         return _loc1_;
      }
      
      private function _ButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 0;
         _loc1_.width = 4;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._ButtonSkin_LinearGradient2_c();
         _loc1_.initialized(this,"_ButtonSkin_Rect3");
         this._ButtonSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_Rect3",this._ButtonSkin_Rect3);
         return _loc1_;
      }
      
      private function _ButtonSkin_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 0;
         _loc1_.entries = [this._ButtonSkin_GradientEntry5_c(),this._ButtonSkin_GradientEntry6_c(),this._ButtonSkin_GradientEntry7_c()];
         return _loc1_;
      }
      
      private function _ButtonSkin_GradientEntry5_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.13;
         _loc1_.color = 0;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _ButtonSkin_GradientEntry6_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.12;
         _loc1_.color = 0;
         _loc1_.ratio = 0.2;
         return _loc1_;
      }
      
      private function _ButtonSkin_GradientEntry7_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0;
         _loc1_.color = 0;
         _loc1_.ratio = 0.55;
         return _loc1_;
      }
      
      private function _ButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ButtonSkin_SolidColor1() : SolidColor
      {
         return this._747523688_ButtonSkin_SolidColor1;
      }
      
      public function set _ButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._747523688_ButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._747523688_ButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ButtonSkin_SolidColorStroke1() : SolidColorStroke
      {
         return this._2136706608_ButtonSkin_SolidColorStroke1;
      }
      
      public function set _ButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._2136706608_ButtonSkin_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._2136706608_ButtonSkin_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ButtonSkin_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
   }
}
