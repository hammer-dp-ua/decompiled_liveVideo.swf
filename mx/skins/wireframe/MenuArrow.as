package mx.skins.wireframe
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Path;
   
   public class MenuArrow extends Skin
   {
       
      
      private var _93090825arrow:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function MenuArrow()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._MenuArrow_Path1_i()];
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
      
      private function _MenuArrow_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 5 4 L 4 4 L 4 3 L 3 3 L 3 2 L 2 2 L 2 1 L 1 1 L 1 0 L 0 0 L 0 9 L 1 9 L 1 8 L 2 8 L 2 7 L 3 7 L 3 6 L 4 6 L 4 5 L 5 5 L 5 4 Z";
         _loc1_.fill = this._MenuArrow_SolidColor1_c();
         _loc1_.initialized(this,"arrow");
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _MenuArrow_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 7368816;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow() : Path
      {
         return this._93090825arrow;
      }
      
      public function set arrow(param1:Path) : void
      {
         var _loc2_:Object = this._93090825arrow;
         if(_loc2_ !== param1)
         {
            this._93090825arrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow",_loc2_,param1));
            }
         }
      }
   }
}
