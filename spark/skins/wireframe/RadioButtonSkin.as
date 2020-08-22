package spark.skins.wireframe
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RadioButton;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Ellipse;
   
   public class RadioButtonSkin extends Skin implements IStateClient2
   {
       
      
      public var _RadioButtonSkin_Ellipse1:Ellipse;
      
      public var _RadioButtonSkin_Ellipse2:Ellipse;
      
      public var _RadioButtonSkin_Ellipse3:Ellipse;
      
      private var _399597734_RadioButtonSkin_Group1:Group;
      
      private var _1007364389_RadioButtonSkin_SolidColor1:SolidColor;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:RadioButton;
      
      public function RadioButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._RadioButtonSkin_Group1_i(),this._RadioButtonSkin_Label1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._RadioButtonSkin_Ellipse2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._RadioButtonSkin_Ellipse3_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonSkin_SolidColor1",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_RadioButtonSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RadioButtonSkin_Ellipse1"]
            }),new SetProperty().initializeFromObject({
               "target":"_RadioButtonSkin_SolidColor1",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"_RadioButtonSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RadioButtonSkin_Ellipse1"]
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"_RadioButtonSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RadioButtonSkin_Ellipse1"]
            }),new SetProperty().initializeFromObject({
               "target":"_RadioButtonSkin_SolidColor1",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"_RadioButtonSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RadioButtonSkin_Ellipse1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_RadioButtonSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RadioButtonSkin_Ellipse1"]
            }),new SetProperty().initializeFromObject({
               "target":"_RadioButtonSkin_SolidColor1",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"_RadioButtonSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RadioButtonSkin_Ellipse1"]
            }),new SetProperty().initializeFromObject({
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
      
      private function _RadioButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._RadioButtonSkin_Ellipse1_i()];
         _loc1_.id = "_RadioButtonSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RadioButtonSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonSkin_Group1",this._RadioButtonSkin_Group1);
         return _loc1_;
      }
      
      private function _RadioButtonSkin_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.width = 12;
         _loc1_.height = 12;
         _loc1_.stroke = this._RadioButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._RadioButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_RadioButtonSkin_Ellipse1");
         this._RadioButtonSkin_Ellipse1 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonSkin_Ellipse1",this._RadioButtonSkin_Ellipse1);
         return _loc1_;
      }
      
      private function _RadioButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         return _loc1_;
      }
      
      private function _RadioButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         this._RadioButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonSkin_SolidColor1",this._RadioButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _RadioButtonSkin_Ellipse2_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 1;
         _loc1_.top = 0.5;
         _loc1_.right = 1;
         _loc1_.bottom = 0.5;
         _loc1_.stroke = this._RadioButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"_RadioButtonSkin_Ellipse2");
         this._RadioButtonSkin_Ellipse2 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonSkin_Ellipse2",this._RadioButtonSkin_Ellipse2);
         return _loc1_;
      }
      
      private function _RadioButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._RadioButtonSkin_GradientEntry1_c(),this._RadioButtonSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _RadioButtonSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.25;
         return _loc1_;
      }
      
      private function _RadioButtonSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _RadioButtonSkin_Ellipse3_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 4;
         _loc1_.top = 3.5;
         _loc1_.width = 5;
         _loc1_.height = 5;
         _loc1_.fill = this._RadioButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"_RadioButtonSkin_Ellipse3");
         this._RadioButtonSkin_Ellipse3 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonSkin_Ellipse3",this._RadioButtonSkin_Ellipse3);
         return _loc1_;
      }
      
      private function _RadioButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4605510;
         return _loc1_;
      }
      
      private function _RadioButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.left = 18;
         _loc1_.right = 0;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.verticalCenter = 2;
         _loc1_.setStyle("textAlign","start");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonSkin_Group1() : Group
      {
         return this._399597734_RadioButtonSkin_Group1;
      }
      
      public function set _RadioButtonSkin_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._399597734_RadioButtonSkin_Group1;
         if(_loc2_ !== param1)
         {
            this._399597734_RadioButtonSkin_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonSkin_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonSkin_SolidColor1() : SolidColor
      {
         return this._1007364389_RadioButtonSkin_SolidColor1;
      }
      
      public function set _RadioButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1007364389_RadioButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1007364389_RadioButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : RadioButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:RadioButton) : void
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
