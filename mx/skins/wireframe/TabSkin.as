package mx.skins.wireframe
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Rect;
   
   public class TabSkin extends Skin implements IStateClient2
   {
       
      
      public var _TabSkin_Rect2:Rect;
      
      public var _TabSkin_Rect3:Rect;
      
      public var _TabSkin_Rect4:Rect;
      
      public var _TabSkin_Rect5:Rect;
      
      private var _163542355_TabSkin_SolidColor1:SolidColor;
      
      private var _3143043fill:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function TabSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._TabSkin_Rect1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TabSkin_Rect2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TabSkin_Rect3_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TabSkin_Rect4_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TabSkin_Rect5_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TabSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new SetProperty().initializeFromObject({
               "target":"_TabSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"selectedUp",
            "stateGroups":["selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TabSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"selectedOver",
            "stateGroups":["selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TabSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"selectedDown",
            "stateGroups":["selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TabSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"selectedDisabled",
            "stateGroups":["disabledStates","selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TabSkin_SolidColor1",
               "name":"color",
               "value":15658734
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
      
      private function _TabSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 69;
         _loc1_.height = 20;
         _loc1_.topLeftRadiusX = 2;
         _loc1_.topRightRadiusX = 2;
         _loc1_.stroke = this._TabSkin_SolidColorStroke1_c();
         _loc1_.fill = this._TabSkin_SolidColor1_i();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _TabSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7368816;
         return _loc1_;
      }
      
      private function _TabSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._TabSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_TabSkin_SolidColor1",this._TabSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _TabSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.top = 1;
         _loc1_.right = 2;
         _loc1_.height = 1;
         _loc1_.fill = this._TabSkin_SolidColor2_c();
         _loc1_.initialized(this,"_TabSkin_Rect2");
         this._TabSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_TabSkin_Rect2",this._TabSkin_Rect2);
         return _loc1_;
      }
      
      private function _TabSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.25;
         return _loc1_;
      }
      
      private function _TabSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._TabSkin_SolidColor3_c();
         _loc1_.initialized(this,"_TabSkin_Rect3");
         this._TabSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_TabSkin_Rect3",this._TabSkin_Rect3);
         return _loc1_;
      }
      
      private function _TabSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _TabSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._TabSkin_SolidColor4_c();
         _loc1_.initialized(this,"_TabSkin_Rect4");
         this._TabSkin_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_TabSkin_Rect4",this._TabSkin_Rect4);
         return _loc1_;
      }
      
      private function _TabSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _TabSkin_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 1;
         _loc1_.top = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._TabSkin_SolidColor5_c();
         _loc1_.initialized(this,"_TabSkin_Rect5");
         this._TabSkin_Rect5 = _loc1_;
         BindingManager.executeBindings(this,"_TabSkin_Rect5",this._TabSkin_Rect5);
         return _loc1_;
      }
      
      private function _TabSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TabSkin_SolidColor1() : SolidColor
      {
         return this._163542355_TabSkin_SolidColor1;
      }
      
      public function set _TabSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._163542355_TabSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._163542355_TabSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TabSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fill() : Rect
      {
         return this._3143043fill;
      }
      
      public function set fill(param1:Rect) : void
      {
         var _loc2_:Object = this._3143043fill;
         if(_loc2_ !== param1)
         {
            this._3143043fill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fill",_loc2_,param1));
            }
         }
      }
   }
}
