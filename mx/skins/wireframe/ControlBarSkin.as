package mx.skins.wireframe
{
   import mx.core.IFlexModuleFactory;
   import mx.graphics.SolidColor;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Rect;
   
   public class ControlBarSkin extends Skin
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ControlBarSkin()
      {
         super();
         mx_internal::_document = this;
         this.minHeight = 21;
         this.minWidth = 21;
         this.mxmlContent = [this._ControlBarSkin_Rect1_c(),this._ControlBarSkin_Rect2_c()];
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
      
      private function _ControlBarSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.top = 1;
         _loc1_.fill = this._ControlBarSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ControlBarSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _ControlBarSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.height = 1;
         _loc1_.fill = this._ControlBarSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ControlBarSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         return _loc1_;
      }
   }
}
