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
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class ButtonBarFirstButtonSkin extends Skin implements IStateClient2
   {
       
      
      public var _ButtonBarFirstButtonSkin_Path1:Path;
      
      public var _ButtonBarFirstButtonSkin_Rect1:Rect;
      
      public var _ButtonBarFirstButtonSkin_Rect2:Rect;
      
      public var _ButtonBarFirstButtonSkin_Rect3:Rect;
      
      public var _ButtonBarFirstButtonSkin_Rect4:Rect;
      
      private var _641886537_ButtonBarFirstButtonSkin_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ButtonBarFirstButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._ButtonBarFirstButtonSkin_Path1_i(),this._ButtonBarFirstButtonSkin_Path2_c()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonBarFirstButtonSkin_Rect1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonBarFirstButtonSkin_Rect2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonBarFirstButtonSkin_Rect3_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ButtonBarFirstButtonSkin_Rect4_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonBarFirstButtonSkin_SolidColor1",
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
            "stateGroups":["selectedUpStates","selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"selectedOver",
            "stateGroups":["overStates","selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"selectedDown",
            "stateGroups":["downStates","selectedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ButtonBarFirstButtonSkin_Path1"]
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"selectedDisabled",
            "stateGroups":["disabledStates","selectedUpStates","selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonBarFirstButtonSkin_SolidColor1",
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
      
      private function _ButtonBarFirstButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.data = "M 67 0 l 0 18 l -65.2 0 C 0.8 18 0 17.2 0 16.2 L 0 1.8 C 0.8 0 0 0.8 1.8 0 L 67 0 z";
         _loc1_.fill = this._ButtonBarFirstButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_ButtonBarFirstButtonSkin_Path1");
         this._ButtonBarFirstButtonSkin_Path1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonBarFirstButtonSkin_Path1",this._ButtonBarFirstButtonSkin_Path1);
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._ButtonBarFirstButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonBarFirstButtonSkin_SolidColor1",this._ButtonBarFirstButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._ButtonBarFirstButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"_ButtonBarFirstButtonSkin_Rect1");
         this._ButtonBarFirstButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonBarFirstButtonSkin_Rect1",this._ButtonBarFirstButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._ButtonBarFirstButtonSkin_SolidColor3_c();
         _loc1_.initialized(this,"_ButtonBarFirstButtonSkin_Rect2");
         this._ButtonBarFirstButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonBarFirstButtonSkin_Rect2",this._ButtonBarFirstButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._ButtonBarFirstButtonSkin_SolidColor4_c();
         _loc1_.initialized(this,"_ButtonBarFirstButtonSkin_Rect3");
         this._ButtonBarFirstButtonSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonBarFirstButtonSkin_Rect3",this._ButtonBarFirstButtonSkin_Rect3);
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.25;
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._ButtonBarFirstButtonSkin_SolidColor5_c();
         _loc1_.initialized(this,"_ButtonBarFirstButtonSkin_Rect4");
         this._ButtonBarFirstButtonSkin_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonBarFirstButtonSkin_Rect4",this._ButtonBarFirstButtonSkin_Rect4);
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.09;
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_Path2_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.data = "M 69 0 l 0 20 l -67.2 0 C 0.8 20 0 19.2 0 18.2 L 0 1.8 C 0.8 0 0 0.8 1.8 0 L 69 0 z";
         _loc1_.stroke = this._ButtonBarFirstButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ButtonBarFirstButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7368816;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ButtonBarFirstButtonSkin_SolidColor1() : SolidColor
      {
         return this._641886537_ButtonBarFirstButtonSkin_SolidColor1;
      }
      
      public function set _ButtonBarFirstButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._641886537_ButtonBarFirstButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._641886537_ButtonBarFirstButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ButtonBarFirstButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
   }
}
