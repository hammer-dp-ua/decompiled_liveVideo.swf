package mx.skins.wireframe
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class ScrollBarDownButtonSkin extends Skin implements IStateClient2
   {
       
      
      public var _ScrollBarDownButtonSkin_Rect1:Rect;
      
      public var _ScrollBarDownButtonSkin_Rect2:Rect;
      
      private var _902860850_ScrollBarDownButtonSkin_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ScrollBarDownButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.blendMode = "normal";
         this.mxmlContent = [this._ScrollBarDownButtonSkin_Rect1_i(),this._ScrollBarDownButtonSkin_Path1_c()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ScrollBarDownButtonSkin_Rect2_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ScrollBarDownButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ScrollBarDownButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarDownButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
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
         _loc1_.fill = this._ScrollBarDownButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_ScrollBarDownButtonSkin_Rect1");
         this._ScrollBarDownButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarDownButtonSkin_Rect1",this._ScrollBarDownButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7368816;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._ScrollBarDownButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarDownButtonSkin_SolidColor1",this._ScrollBarDownButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.stroke = this._ScrollBarDownButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"_ScrollBarDownButtonSkin_Rect2");
         this._ScrollBarDownButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarDownButtonSkin_Rect2",this._ScrollBarDownButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ScrollBarDownButtonSkin_GradientEntry1_c(),this._ScrollBarDownButtonSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.25;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ScrollBarDownButtonSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 7.5 13 L 11 6 L 3.5 6 L 7.5 13";
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
      public function get _ScrollBarDownButtonSkin_SolidColor1() : SolidColor
      {
         return this._902860850_ScrollBarDownButtonSkin_SolidColor1;
      }
      
      public function set _ScrollBarDownButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._902860850_ScrollBarDownButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._902860850_ScrollBarDownButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScrollBarDownButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
   }
}
