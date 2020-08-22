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
   
   public class ButtonSkin extends Skin implements IStateClient2
   {
       
      
      public var _ButtonSkin_Rect2:Rect;
      
      public var _ButtonSkin_Rect3:Rect;
      
      public var _ButtonSkin_Rect4:Rect;
      
      public var _ButtonSkin_Rect5:Rect;
      
      private var _747523688_ButtonSkin_SolidColor1:SolidColor;
      
      private var _2136706608_ButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var _3143043fill:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 19;
         this.mxmlContent = [this._ButtonSkin_Rect1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect3_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect4_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonSkin_Rect5_i);
         states = [new State({
            "name":"up",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
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
            "stateGroups":["downStates"],
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
               "target":"_ButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":10263708
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonSkin_SolidColor1",
               "name":"color",
               "value":14540253
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
            "stateGroups":["selectedUpStates","selectedStates"],
            "overrides":[]
         }),new State({
            "name":"selectedOver",
            "stateGroups":["overStates","selectedStates"],
            "overrides":[]
         }),new State({
            "name":"selectedDown",
            "stateGroups":["downStates","selectedStates"],
            "overrides":[]
         }),new State({
            "name":"selectedDisabled",
            "stateGroups":["disabledStates","selectedUpStates","selectedStates"],
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
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
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
         _loc1_.left = 2;
         _loc1_.top = 1;
         _loc1_.right = 2;
         _loc1_.height = 1;
         _loc1_.fill = this._ButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"_ButtonSkin_Rect2");
         this._ButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_Rect2",this._ButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _ButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.25;
         return _loc1_;
      }
      
      private function _ButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._ButtonSkin_SolidColor3_c();
         _loc1_.initialized(this,"_ButtonSkin_Rect3");
         this._ButtonSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_Rect3",this._ButtonSkin_Rect3);
         return _loc1_;
      }
      
      private function _ButtonSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _ButtonSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._ButtonSkin_SolidColor4_c();
         _loc1_.initialized(this,"_ButtonSkin_Rect4");
         this._ButtonSkin_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_Rect4",this._ButtonSkin_Rect4);
         return _loc1_;
      }
      
      private function _ButtonSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _ButtonSkin_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 1;
         _loc1_.top = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._ButtonSkin_SolidColor5_c();
         _loc1_.initialized(this,"_ButtonSkin_Rect5");
         this._ButtonSkin_Rect5 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonSkin_Rect5",this._ButtonSkin_Rect5);
         return _loc1_;
      }
      
      private function _ButtonSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
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
