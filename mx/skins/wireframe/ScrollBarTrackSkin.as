package mx.skins.wireframe
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Rect;
   
   public class ScrollBarTrackSkin extends Skin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ScrollBarTrackSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._ScrollBarTrackSkin_Rect1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
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
      
      private function _ScrollBarTrackSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.minWidth = 14;
         _loc1_.minHeight = 14;
         _loc1_.stroke = this._ScrollBarTrackSkin_SolidColorStroke1_c();
         _loc1_.fill = this._ScrollBarTrackSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarTrackSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7368816;
         return _loc1_;
      }
      
      private function _ScrollBarTrackSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
   }
}
