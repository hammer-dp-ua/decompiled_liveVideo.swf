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
   import spark.components.CheckBox;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class CheckBoxSkin extends Skin implements IStateClient2
   {
       
      
      private var _1997401138_CheckBoxSkin_Group1:Group;
      
      public var _CheckBoxSkin_Path1:Path;
      
      public var _CheckBoxSkin_Rect1:Rect;
      
      public var _CheckBoxSkin_Rect2:Rect;
      
      private var _584316185_CheckBoxSkin_SolidColor1:SolidColor;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:CheckBox;
      
      public function CheckBoxSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._CheckBoxSkin_Group1_i(),this._CheckBoxSkin_Label1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CheckBoxSkin_Path1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CheckBoxSkin_Rect2_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CheckBoxSkin_SolidColor1",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"_CheckBoxSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CheckBoxSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_CheckBoxSkin_SolidColor1",
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
               "itemsFactory":_loc1_,
               "destination":"_CheckBoxSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CheckBoxSkin_Rect1"]
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_CheckBoxSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CheckBoxSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_CheckBoxSkin_SolidColor1",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_CheckBoxSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CheckBoxSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"_CheckBoxSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CheckBoxSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_CheckBoxSkin_SolidColor1",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_CheckBoxSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CheckBoxSkin_Rect1"]
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
      
      private function _CheckBoxSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.layoutDirection = "ltr";
         _loc1_.mxmlContent = [this._CheckBoxSkin_Rect1_i()];
         _loc1_.id = "_CheckBoxSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CheckBoxSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_CheckBoxSkin_Group1",this._CheckBoxSkin_Group1);
         return _loc1_;
      }
      
      private function _CheckBoxSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.minWidth = 12;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minHeight = 12;
         _loc1_.stroke = this._CheckBoxSkin_SolidColorStroke1_c();
         _loc1_.fill = this._CheckBoxSkin_SolidColor1_i();
         _loc1_.initialized(this,"_CheckBoxSkin_Rect1");
         this._CheckBoxSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_CheckBoxSkin_Rect1",this._CheckBoxSkin_Rect1);
         return _loc1_;
      }
      
      private function _CheckBoxSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6052956;
         return _loc1_;
      }
      
      private function _CheckBoxSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         this._CheckBoxSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_CheckBoxSkin_SolidColor1",this._CheckBoxSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _CheckBoxSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.stroke = this._CheckBoxSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"_CheckBoxSkin_Rect2");
         this._CheckBoxSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_CheckBoxSkin_Rect2",this._CheckBoxSkin_Rect2);
         return _loc1_;
      }
      
      private function _CheckBoxSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._CheckBoxSkin_GradientEntry1_c(),this._CheckBoxSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _CheckBoxSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0.25;
         return _loc1_;
      }
      
      private function _CheckBoxSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6052956;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _CheckBoxSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 3.5 6.5 l 2 2 l 6 -7";
         _loc1_.stroke = this._CheckBoxSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,"_CheckBoxSkin_Path1");
         this._CheckBoxSkin_Path1 = _loc1_;
         BindingManager.executeBindings(this,"_CheckBoxSkin_Path1",this._CheckBoxSkin_Path1);
         return _loc1_;
      }
      
      private function _CheckBoxSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         _loc1_.color = 4605510;
         return _loc1_;
      }
      
      private function _CheckBoxSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.left = 18;
         _loc1_.right = 0;
         _loc1_.top = 2;
         _loc1_.bottom = 0;
         _loc1_.verticalCenter = 1;
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
      public function get _CheckBoxSkin_Group1() : Group
      {
         return this._1997401138_CheckBoxSkin_Group1;
      }
      
      public function set _CheckBoxSkin_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._1997401138_CheckBoxSkin_Group1;
         if(_loc2_ !== param1)
         {
            this._1997401138_CheckBoxSkin_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CheckBoxSkin_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CheckBoxSkin_SolidColor1() : SolidColor
      {
         return this._584316185_CheckBoxSkin_SolidColor1;
      }
      
      public function set _CheckBoxSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._584316185_CheckBoxSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._584316185_CheckBoxSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CheckBoxSkin_SolidColor1",_loc2_,param1));
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
      public function get hostComponent() : CheckBox
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:CheckBox) : void
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
