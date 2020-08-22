package mx.skins.wireframe
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class ScrollBarThumbSkin extends Skin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ScrollBarThumbSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._ScrollBarThumbSkin_Rect1_c(),this._ScrollBarThumbSkin_Group1_c()];
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
      
      private function _ScrollBarThumbSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 14;
         _loc1_.minHeight = 14;
         _loc1_.stroke = this._ScrollBarThumbSkin_SolidColorStroke1_c();
         _loc1_.fill = this._ScrollBarThumbSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -1;
         _loc1_.mxmlContent = [this._ScrollBarThumbSkin_Rect2_c(),this._ScrollBarThumbSkin_Line1_c(),this._ScrollBarThumbSkin_Line2_c(),this._ScrollBarThumbSkin_Line3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 6;
         _loc1_.height = 7;
         _loc1_.fill = this._ScrollBarThumbSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.yFrom = 1;
         _loc1_.yTo = 1;
         _loc1_.xFrom = 0;
         _loc1_.xTo = 6;
         _loc1_.stroke = this._ScrollBarThumbSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         _loc1_.pixelHinting = true;
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.yFrom = 4;
         _loc1_.yTo = 4;
         _loc1_.xFrom = 0;
         _loc1_.xTo = 6;
         _loc1_.stroke = this._ScrollBarThumbSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         _loc1_.pixelHinting = true;
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.yFrom = 7;
         _loc1_.yTo = 7;
         _loc1_.xFrom = 0;
         _loc1_.xTo = 6;
         _loc1_.stroke = this._ScrollBarThumbSkin_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarThumbSkin_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         _loc1_.pixelHinting = true;
         return _loc1_;
      }
   }
}
