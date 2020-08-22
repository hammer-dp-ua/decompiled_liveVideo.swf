package spark.skins.wireframe
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
   import spark.components.Button;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class ComboBoxButtonSkin extends Skin implements IStateClient2
   {
       
      
      public var _ComboBoxButtonSkin_Rect1:Rect;
      
      public var _ComboBoxButtonSkin_Rect2:Rect;
      
      public var _ComboBoxButtonSkin_Rect3:Rect;
      
      public var _ComboBoxButtonSkin_Rect4:Rect;
      
      public var _ComboBoxButtonSkin_Rect5:Rect;
      
      private var _452855515_ComboBoxButtonSkin_SolidColor1:SolidColor;
      
      private var _93090825arrow:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function ComboBoxButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 19;
         this.minHeight = 21;
         this.mxmlContent = [this._ComboBoxButtonSkin_Rect1_i(),this._ComboBoxButtonSkin_Path1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ComboBoxButtonSkin_Rect2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ComboBoxButtonSkin_Rect3_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ComboBoxButtonSkin_Rect4_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ComboBoxButtonSkin_Rect5_i);
         states = [new State({
            "name":"up",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ComboBoxButtonSkin_SolidColor1",
               "name":"color",
               "value":15658734
            })]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ComboBoxButtonSkin_SolidColor1",
               "name":"color",
               "value":14540253
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ComboBoxButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ComboBoxButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ComboBoxButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ComboBoxButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_ComboBoxButtonSkin_SolidColor1",
               "name":"color",
               "value":14540253
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
      
      private function _ComboBoxButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 69;
         _loc1_.height = 20;
         _loc1_.topRightRadiusX = 2;
         _loc1_.bottomRightRadiusX = 2;
         _loc1_.stroke = this._ComboBoxButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._ComboBoxButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_ComboBoxButtonSkin_Rect1");
         this._ComboBoxButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ComboBoxButtonSkin_Rect1",this._ComboBoxButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7368816;
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12237498;
         this._ComboBoxButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ComboBoxButtonSkin_SolidColor1",this._ComboBoxButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.top = 1;
         _loc1_.right = 2;
         _loc1_.height = 1;
         _loc1_.fill = this._ComboBoxButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"_ComboBoxButtonSkin_Rect2");
         this._ComboBoxButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_ComboBoxButtonSkin_Rect2",this._ComboBoxButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.25;
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._ComboBoxButtonSkin_SolidColor3_c();
         _loc1_.initialized(this,"_ComboBoxButtonSkin_Rect3");
         this._ComboBoxButtonSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_ComboBoxButtonSkin_Rect3",this._ComboBoxButtonSkin_Rect3);
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._ComboBoxButtonSkin_SolidColor4_c();
         _loc1_.initialized(this,"_ComboBoxButtonSkin_Rect4");
         this._ComboBoxButtonSkin_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_ComboBoxButtonSkin_Rect4",this._ComboBoxButtonSkin_Rect4);
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 1;
         _loc1_.top = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._ComboBoxButtonSkin_SolidColor5_c();
         _loc1_.initialized(this,"_ComboBoxButtonSkin_Rect5");
         this._ComboBoxButtonSkin_Rect5 = _loc1_;
         BindingManager.executeBindings(this,"_ComboBoxButtonSkin_Rect5",this._ComboBoxButtonSkin_Rect5);
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.right = 6;
         _loc1_.verticalCenter = 0;
         _loc1_.data = "M 4.0 4.0 L 4.0 3.0 L 5.0 3.0 L 5.0 2.0 L 6.0 2.0 L 6.0 1.0 L 7.0 1.0 L 7.0 0.0 L 0.0 0.0 L 0.0 1.0 L 1.0 1.0 L 1.0 2.0 L 2.0 2.0 L 2.0 3.0 L 3.0 3.0 L 3.0 4.0 L 4.0 4.0";
         _loc1_.fill = this._ComboBoxButtonSkin_SolidColor6_c();
         _loc1_.initialized(this,"arrow");
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _ComboBoxButtonSkin_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ComboBoxButtonSkin_SolidColor1() : SolidColor
      {
         return this._452855515_ComboBoxButtonSkin_SolidColor1;
      }
      
      public function set _ComboBoxButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._452855515_ComboBoxButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._452855515_ComboBoxButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ComboBoxButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
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
