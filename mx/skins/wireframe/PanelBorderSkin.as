package mx.skins.wireframe
{
   import flash.geom.Rectangle;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   import mx.binding.BindingManager;
   import mx.core.EdgeMetrics;
   import mx.core.IFlexModuleFactory;
   import mx.core.IRectangularBorder;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.supportClasses.Skin;
   import spark.filters.DropShadowFilter;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   
   public class PanelBorderSkin extends Skin implements IRectangularBorder
   {
      
      private static var panels:Object = {};
       
      
      private var _1427077073backgroundFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _809612678contentGroup:Group;
      
      private var _3553075tbbg:Rect;
      
      private var _110147427tbdiv:Rect;
      
      private var _3553263tbhi:Rect;
      
      private var _1893287094titleDisplay:Label;
      
      private var _988229078topGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _metrics:EdgeMetrics;
      
      private var _backgroundImageBounds:Rectangle;
      
      private var cornerRadius:Number;
      
      public function PanelBorderSkin()
      {
         this._metrics = new EdgeMetrics(1,32,1,1);
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._PanelBorderSkin_Rect1_c(),this._PanelBorderSkin_Rect2_i(),this._PanelBorderSkin_Rect3_c(),this._PanelBorderSkin_Group1_c()];
      }
      
      private static function isPanel(param1:Object) : Boolean
      {
         var s:String = null;
         var x:XML = null;
         var parent:Object = param1;
         s = getQualifiedClassName(parent);
         if(panels[s] == 1)
         {
            return true;
         }
         if(panels[s] == 0)
         {
            return false;
         }
         if(s == "mx.containers::Panel")
         {
            panels[s] == 1;
            return true;
         }
         x = describeType(parent);
         var xmllist:XMLList = x.extendsClass.(@type == "mx.containers::Panel");
         if(xmllist.length() == 0)
         {
            panels[s] = 0;
            return false;
         }
         panels[s] = 1;
         return true;
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
      
      public function get borderMetrics() : EdgeMetrics
      {
         var _loc3_:Number = NaN;
         var _loc1_:Boolean = isPanel(parent);
         var _loc2_:IUIComponent = !!_loc1_?Object(parent).mx_internal::_controlBar:null;
         if(_loc1_)
         {
            _loc3_ = Object(parent).getStyle("headerHeight") + 2;
         }
         if(isNaN(_loc3_))
         {
            _loc3_ = !!_loc1_?Number(Object(parent).mx_internal::getHeaderHeightProxy(true) + 1):Number(32);
         }
         this._metrics.top = _loc3_;
         if(_loc2_ && _loc2_.includeInLayout)
         {
            this._metrics.bottom = _loc2_.getExplicitOrMeasuredHeight() + 1;
         }
         else
         {
            this._metrics.bottom = 1;
         }
         return this._metrics;
      }
      
      public function get backgroundImageBounds() : Rectangle
      {
         return this._backgroundImageBounds;
      }
      
      public function set backgroundImageBounds(param1:Rectangle) : void
      {
         if(this._backgroundImageBounds && param1 && this._backgroundImageBounds.equals(param1))
         {
            return;
         }
         this._backgroundImageBounds = param1;
         invalidateDisplayList();
      }
      
      public function get hasBackgroundImage() : Boolean
      {
         return false;
      }
      
      public function layoutBackgroundImage() : void
      {
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:Boolean = isPanel(parent);
         if(_loc3_)
         {
            _loc4_ = Object(parent).getStyle("headerHeight");
         }
         if(isNaN(_loc4_))
         {
            _loc4_ = !!_loc3_?Number(Object(parent).mx_internal::getHeaderHeightProxy(true) - 1):Number(30);
         }
         this.tbbg.height = _loc4_;
         this.tbhi.height = _loc4_;
         this.tbdiv.top = _loc4_;
         var _loc5_:EdgeMetrics = this.borderMetrics;
         if(_loc5_.bottom > 1)
         {
         }
         if(getStyle("borderVisible") == false)
         {
            this.border.visible = false;
         }
         else
         {
            this.border.visible = true;
         }
         var _loc6_:Number = getStyle("cornerRadius");
         if(this.cornerRadius != _loc6_)
         {
            this.cornerRadius = _loc6_;
            this.border.topLeftRadiusX = this.cornerRadius;
            this.border.topRightRadiusX = this.cornerRadius;
         }
         this.backgroundFill.color = getStyle("backgroundColor");
         this.backgroundFill.alpha = getStyle("backgroundAlpha");
         super.updateDisplayList(param1,param2);
      }
      
      private function _PanelBorderSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.filters = [this._PanelBorderSkin_DropShadowFilter1_c()];
         _loc1_.fill = this._PanelBorderSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.blurX = 15;
         _loc1_.blurY = 15;
         _loc1_.alpha = 0.18;
         _loc1_.distance = 11;
         _loc1_.angle = 90;
         _loc1_.knockout = true;
         return _loc1_;
      }
      
      private function _PanelBorderSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._PanelBorderSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7368816;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._PanelBorderSkin_SolidColor2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.backgroundFill = _loc1_;
         BindingManager.executeBindings(this,"backgroundFill",this.backgroundFill);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.layout = this._PanelBorderSkin_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._PanelBorderSkin_Group2_i(),this._PanelBorderSkin_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PanelBorderSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "justify";
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._PanelBorderSkin_Rect4_i(),this._PanelBorderSkin_Rect5_i(),this._PanelBorderSkin_Rect6_i(),this._PanelBorderSkin_Label1_i()];
         _loc1_.id = "topGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topGroup = _loc1_;
         BindingManager.executeBindings(this,"topGroup",this.topGroup);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 1;
         _loc1_.fill = this._PanelBorderSkin_SolidColor3_c();
         _loc1_.initialized(this,"tbbg");
         this.tbbg = _loc1_;
         BindingManager.executeBindings(this,"tbbg",this.tbbg);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._PanelBorderSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"tbhi");
         this.tbhi = _loc1_;
         BindingManager.executeBindings(this,"tbhi",this.tbhi);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._PanelBorderSkin_GradientEntry1_c(),this._PanelBorderSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _PanelBorderSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _PanelBorderSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Rect6_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.height = 1;
         _loc1_.fill = this._PanelBorderSkin_SolidColor4_c();
         _loc1_.initialized(this,"tbdiv");
         this.tbdiv = _loc1_;
         BindingManager.executeBindings(this,"tbdiv",this.tbdiv);
         return _loc1_;
      }
      
      private function _PanelBorderSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _PanelBorderSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.left = 9;
         _loc1_.right = 3;
         _loc1_.top = 1;
         _loc1_.minHeight = 30;
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
      
      private function _PanelBorderSkin_Group3_i() : Group
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
      
      [Bindable(event="propertyChange")]
      public function get backgroundFill() : SolidColor
      {
         return this._1427077073backgroundFill;
      }
      
      public function set backgroundFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1427077073backgroundFill;
         if(_loc2_ !== param1)
         {
            this._1427077073backgroundFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
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
      public function get tbbg() : Rect
      {
         return this._3553075tbbg;
      }
      
      public function set tbbg(param1:Rect) : void
      {
         var _loc2_:Object = this._3553075tbbg;
         if(_loc2_ !== param1)
         {
            this._3553075tbbg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tbbg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tbdiv() : Rect
      {
         return this._110147427tbdiv;
      }
      
      public function set tbdiv(param1:Rect) : void
      {
         var _loc2_:Object = this._110147427tbdiv;
         if(_loc2_ !== param1)
         {
            this._110147427tbdiv = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tbdiv",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tbhi() : Rect
      {
         return this._3553263tbhi;
      }
      
      public function set tbhi(param1:Rect) : void
      {
         var _loc2_:Object = this._3553263tbhi;
         if(_loc2_ !== param1)
         {
            this._3553263tbhi = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tbhi",_loc2_,param1));
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
      public function get topGroup() : Group
      {
         return this._988229078topGroup;
      }
      
      public function set topGroup(param1:Group) : void
      {
         var _loc2_:Object = this._988229078topGroup;
         if(_loc2_ !== param1)
         {
            this._988229078topGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topGroup",_loc2_,param1));
            }
         }
      }
   }
}
