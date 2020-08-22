package mx.skins.wireframe
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Rect;
   
   public class SliderThumbSkin extends Skin implements IStateClient2
   {
       
      
      private var _2029910131_SliderThumbSkin_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SliderThumbSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SliderThumbSkin_Rect1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDown"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SliderThumbSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDown"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SliderThumbSkin_SolidColor1",
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
      
      private function _SliderThumbSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 7;
         _loc1_.radiusY = 7;
         _loc1_.width = 11;
         _loc1_.height = 11;
         _loc1_.stroke = this._SliderThumbSkin_SolidColorStroke1_c();
         _loc1_.fill = this._SliderThumbSkin_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SliderThumbSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         return _loc1_;
      }
      
      private function _SliderThumbSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._SliderThumbSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_SliderThumbSkin_SolidColor1",this._SliderThumbSkin_SolidColor1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SliderThumbSkin_SolidColor1() : SolidColor
      {
         return this._2029910131_SliderThumbSkin_SolidColor1;
      }
      
      public function set _SliderThumbSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._2029910131_SliderThumbSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._2029910131_SliderThumbSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SliderThumbSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
   }
}
