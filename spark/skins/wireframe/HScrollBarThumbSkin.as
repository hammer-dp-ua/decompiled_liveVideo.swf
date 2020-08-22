package spark.skins.wireframe
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class HScrollBarThumbSkin extends Skin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function HScrollBarThumbSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._HScrollBarThumbSkin_Rect1_c(),this._HScrollBarThumbSkin_Group1_c(),this._HScrollBarThumbSkin_Line4_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
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
      
      private function _HScrollBarThumbSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 14;
         _loc1_.minHeight = 14;
         _loc1_.stroke = this._HScrollBarThumbSkin_SolidColorStroke1_c();
         _loc1_.fill = this._HScrollBarThumbSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = -1;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._HScrollBarThumbSkin_Line1_c(),this._HScrollBarThumbSkin_Line2_c(),this._HScrollBarThumbSkin_Line3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 1;
         _loc1_.xTo = 1;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 6;
         _loc1_.stroke = this._HScrollBarThumbSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6710886;
         _loc1_.pixelHinting = true;
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 4;
         _loc1_.xTo = 4;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 6;
         _loc1_.stroke = this._HScrollBarThumbSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6710886;
         _loc1_.pixelHinting = true;
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 7;
         _loc1_.xTo = 7;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 6;
         _loc1_.stroke = this._HScrollBarThumbSkin_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6710886;
         _loc1_.pixelHinting = true;
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.alpha = 0.38;
         _loc1_.right = -1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.stroke = this._HScrollBarThumbSkin_SolidColorStroke5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _HScrollBarThumbSkin_SolidColorStroke5_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
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
