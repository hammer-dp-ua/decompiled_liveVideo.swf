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
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.TitleWindow;
   import spark.components.supportClasses.Skin;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   public class TitleWindowSkin extends Skin implements IStateClient2
   {
       
      
      private var _698040213_TitleWindowSkin_Group1:Group;
      
      private var _631173356bottomGroup:Group;
      
      private var _312699062closeButton:Button;
      
      private var _809612678contentGroup:Group;
      
      private var _139410089controlBarGroup:Group;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _104976386moveArea:Group;
      
      private var _1893287094titleDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:TitleWindow;
      
      public function TitleWindowSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 76;
         this.minHeight = 76;
         this.mxmlContent = [this._TitleWindowSkin_RectangularDropShadow1_i(),this._TitleWindowSkin_Rect1_c(),this._TitleWindowSkin_Rect2_c(),this._TitleWindowSkin_Group1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TitleWindowSkin_Group5_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"inactive",
            "stateGroups":["inactiveGroup"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"dropShadow",
               "name":"distance",
               "value":7
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"normalWithControlBar",
            "stateGroups":["withControls"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_TitleWindowSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            })]
         }),new State({
            "name":"inactiveWithControlBar",
            "stateGroups":["inactiveGroup","withControls"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_TitleWindowSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new SetProperty().initializeFromObject({
               "target":"dropShadow",
               "name":"distance",
               "value":7
            })]
         }),new State({
            "name":"disabledWithControlBar",
            "stateGroups":["withControls"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_TitleWindowSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
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
      
      private function _TitleWindowSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 15;
         _loc1_.blurY = 15;
         _loc1_.alpha = 0.18;
         _loc1_.distance = 11;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._TitleWindowSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7368816;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._TitleWindowSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.layout = this._TitleWindowSkin_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._TitleWindowSkin_Group2_c(),this._TitleWindowSkin_Group4_i()];
         _loc1_.id = "_TitleWindowSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TitleWindowSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_TitleWindowSkin_Group1",this._TitleWindowSkin_Group1);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "justify";
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._TitleWindowSkin_Rect3_c(),this._TitleWindowSkin_Rect4_c(),this._TitleWindowSkin_Rect5_c(),this._TitleWindowSkin_Label1_i(),this._TitleWindowSkin_Group3_i(),this._TitleWindowSkin_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 1;
         _loc1_.fill = this._TitleWindowSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._TitleWindowSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._TitleWindowSkin_GradientEntry1_c(),this._TitleWindowSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _TitleWindowSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.height = 1;
         _loc1_.fill = this._TitleWindowSkin_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.left = 9;
         _loc1_.right = 24;
         _loc1_.top = 1;
         _loc1_.minHeight = 23;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "titleDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleDisplay = _loc1_;
         BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "moveArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moveArea = _loc1_;
         BindingManager.executeBindings(this,"moveArea",this.moveArea);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.right = 2;
         _loc1_.top = 3;
         _loc1_.setStyle("skinClass",TitleWindowCloseButtonSkin);
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.minWidth = 0;
         _loc1_.minHeight = 0;
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.minWidth = 0;
         _loc1_.minHeight = 0;
         _loc1_.mxmlContent = [this._TitleWindowSkin_Rect6_c(),this._TitleWindowSkin_Rect7_c(),this._TitleWindowSkin_Group6_i()];
         _loc1_.id = "bottomGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bottomGroup = _loc1_;
         BindingManager.executeBindings(this,"bottomGroup",this.bottomGroup);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Rect6_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.top = 1;
         _loc1_.fill = this._TitleWindowSkin_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Rect7_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.height = 1;
         _loc1_.fill = this._TitleWindowSkin_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _TitleWindowSkin_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.minWidth = 0;
         _loc1_.minHeight = 0;
         _loc1_.layout = this._TitleWindowSkin_HorizontalLayout1_c();
         _loc1_.id = "controlBarGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controlBarGroup = _loc1_;
         BindingManager.executeBindings(this,"controlBarGroup",this.controlBarGroup);
         return _loc1_;
      }
      
      private function _TitleWindowSkin_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.gap = 10;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TitleWindowSkin_Group1() : Group
      {
         return this._698040213_TitleWindowSkin_Group1;
      }
      
      public function set _TitleWindowSkin_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._698040213_TitleWindowSkin_Group1;
         if(_loc2_ !== param1)
         {
            this._698040213_TitleWindowSkin_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TitleWindowSkin_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bottomGroup() : Group
      {
         return this._631173356bottomGroup;
      }
      
      public function set bottomGroup(param1:Group) : void
      {
         var _loc2_:Object = this._631173356bottomGroup;
         if(_loc2_ !== param1)
         {
            this._631173356bottomGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get closeButton() : Button
      {
         return this._312699062closeButton;
      }
      
      public function set closeButton(param1:Button) : void
      {
         var _loc2_:Object = this._312699062closeButton;
         if(_loc2_ !== param1)
         {
            this._312699062closeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlBarGroup() : Group
      {
         return this._139410089controlBarGroup;
      }
      
      public function set controlBarGroup(param1:Group) : void
      {
         var _loc2_:Object = this._139410089controlBarGroup;
         if(_loc2_ !== param1)
         {
            this._139410089controlBarGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlBarGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moveArea() : Group
      {
         return this._104976386moveArea;
      }
      
      public function set moveArea(param1:Group) : void
      {
         var _loc2_:Object = this._104976386moveArea;
         if(_loc2_ !== param1)
         {
            this._104976386moveArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleDisplay() : Label
      {
         return this._1893287094titleDisplay;
      }
      
      public function set titleDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1893287094titleDisplay;
         if(_loc2_ !== param1)
         {
            this._1893287094titleDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : TitleWindow
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:TitleWindow) : void
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
