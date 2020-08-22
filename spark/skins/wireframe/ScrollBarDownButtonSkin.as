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
   import mx.states.State;
   import spark.components.Button;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class ScrollBarDownButtonSkin extends Skin implements IStateClient2
   {
       
      
      public var _ScrollBarDownButtonSkin_Rect1:Rect;
      
      public var _ScrollBarDownButtonSkin_Rect2:Rect;
      
      public var _ScrollBarDownButtonSkin_Rect3:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function ScrollBarDownButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._ScrollBarDownButtonSkin_Rect1_i(),this._ScrollBarDownButtonSkin_Path1_c()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ScrollBarDownButtonSkin_Rect2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ScrollBarDownButtonSkin_Rect3_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ScrollBarDownButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ScrollBarDownButtonSkin_Rect1"]
            })]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
      
      private function _ScrollBarDownButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.minWidth = 14;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minHeight = 17;
         _loc1_.stroke = this._ScrollBarDownButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._ScrollBarDownButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"_ScrollBarDownButtonSkin_Rect1");
         this._ScrollBarDownButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarDownButtonSkin_Rect1",this._ScrollBarDownButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.y = 0;
         _loc1_.height = 4;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._ScrollBarDownButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"_ScrollBarDownButtonSkin_Rect2");
         this._ScrollBarDownButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarDownButtonSkin_Rect2",this._ScrollBarDownButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ScrollBarDownButtonSkin_GradientEntry1_c(),this._ScrollBarDownButtonSkin_GradientEntry2_c(),this._ScrollBarDownButtonSkin_GradientEntry3_c(),this._ScrollBarDownButtonSkin_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.23;
         _loc1_.color = 0;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.2;
         _loc1_.color = 0;
         _loc1_.ratio = 0.4;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.055;
         _loc1_.color = 0;
         _loc1_.ratio = 0.55;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0;
         _loc1_.color = 0;
         _loc1_.ratio = 0.8;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.x = 0;
         _loc1_.width = 4;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._ScrollBarDownButtonSkin_LinearGradient2_c();
         _loc1_.initialized(this,"_ScrollBarDownButtonSkin_Rect3");
         this._ScrollBarDownButtonSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarDownButtonSkin_Rect3",this._ScrollBarDownButtonSkin_Rect3);
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 0;
         _loc1_.entries = [this._ScrollBarDownButtonSkin_GradientEntry5_c(),this._ScrollBarDownButtonSkin_GradientEntry6_c(),this._ScrollBarDownButtonSkin_GradientEntry7_c()];
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry5_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.13;
         _loc1_.color = 0;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry6_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0.12;
         _loc1_.color = 0;
         _loc1_.ratio = 0.2;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry7_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0;
         _loc1_.color = 0;
         _loc1_.ratio = 0.55;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 4 7 L 7.5 0 0 0 Z";
         _loc1_.height = 5;
         _loc1_.width = 7;
         _loc1_.horizontalCenter = -0.5;
         _loc1_.verticalCenter = 0.5;
         _loc1_.fill = this._ScrollBarDownButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
