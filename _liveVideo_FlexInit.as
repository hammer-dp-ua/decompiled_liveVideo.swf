package
{
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.system.Capabilities;
   import mx.accessibility.AlertAccImpl;
   import mx.accessibility.ButtonAccImpl;
   import mx.accessibility.LabelAccImpl;
   import mx.accessibility.PanelAccImpl;
   import mx.accessibility.SliderAccImpl;
   import mx.accessibility.TabBarAccImpl;
   import mx.accessibility.UIComponentAccProps;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.managers.systemClasses.ChildManager;
   import mx.styles.IStyleManager2;
   import mx.styles.StyleManagerImpl;
   import mx.utils.ObjectProxy;
   import spark.accessibility.ButtonBaseAccImpl;
   import spark.accessibility.CheckBoxAccImpl;
   import spark.accessibility.ComboBoxAccImpl;
   import spark.accessibility.DropDownListBaseAccImpl;
   import spark.accessibility.ListAccImpl;
   import spark.accessibility.ListBaseAccImpl;
   import spark.accessibility.RadioButtonAccImpl;
   import spark.accessibility.RichEditableTextAccImpl;
   import spark.accessibility.TextBaseAccImpl;
   import spark.accessibility.TitleWindowAccImpl;
   import spark.accessibility.ToggleButtonAccImpl;
   
   public class _liveVideo_FlexInit
   {
       
      
      public function _liveVideo_FlexInit()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var styleManager:IStyleManager2 = null;
         var fbs:IFlexModuleFactory = param1;
         new ChildManager(fbs);
         styleManager = new StyleManagerImpl(fbs);
         EffectManager.mx_internal::registerEffectTrigger("addedEffect","added");
         EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect","creationComplete");
         EffectManager.mx_internal::registerEffectTrigger("focusInEffect","focusIn");
         EffectManager.mx_internal::registerEffectTrigger("focusOutEffect","focusOut");
         EffectManager.mx_internal::registerEffectTrigger("hideEffect","hide");
         EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect","mouseDown");
         EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect","mouseUp");
         EffectManager.mx_internal::registerEffectTrigger("moveEffect","move");
         EffectManager.mx_internal::registerEffectTrigger("removedEffect","removed");
         EffectManager.mx_internal::registerEffectTrigger("resizeEffect","resize");
         EffectManager.mx_internal::registerEffectTrigger("resizeEndEffect","resizeEnd");
         EffectManager.mx_internal::registerEffectTrigger("resizeStartEffect","resizeStart");
         EffectManager.mx_internal::registerEffectTrigger("rollOutEffect","rollOut");
         EffectManager.mx_internal::registerEffectTrigger("rollOverEffect","rollOver");
         EffectManager.mx_internal::registerEffectTrigger("showEffect","show");
         if(Capabilities.hasAccessibility)
         {
            mx.accessibility.PanelAccImpl.enableAccessibility();
            TabBarAccImpl.enableAccessibility();
            ButtonBaseAccImpl.enableAccessibility();
            ListBaseAccImpl.enableAccessibility();
            RadioButtonAccImpl.enableAccessibility();
            ToggleButtonAccImpl.enableAccessibility();
            ComboBoxAccImpl.enableAccessibility();
            AlertAccImpl.enableAccessibility();
            RichEditableTextAccImpl.enableAccessibility();
            LabelAccImpl.enableAccessibility();
            TextBaseAccImpl.enableAccessibility();
            TitleWindowAccImpl.enableAccessibility();
            spark.accessibility.PanelAccImpl.enableAccessibility();
            ListAccImpl.enableAccessibility();
            CheckBoxAccImpl.enableAccessibility();
            SliderAccImpl.enableAccessibility();
            DropDownListBaseAccImpl.enableAccessibility();
            ButtonAccImpl.enableAccessibility();
            UIComponentAccProps.enableAccessibility();
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayCollection") != ArrayCollection)
            {
               registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayList") != ArrayList)
            {
               registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ObjectProxy") != ObjectProxy)
            {
               registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
         }
         var styleNames:Array = ["lineHeight","unfocusedTextSelectionColor","kerning","showErrorSkin","textRollOverColor","digitCase","inactiveTextSelectionColor","listAutoPadding","textDecoration","showErrorTip","justificationRule","dominantBaseline","fontThickness","textShadowColor","trackingRight","blockProgression","leadingModel","listStylePosition","textAlignLast","textShadowAlpha","textAlpha","letterSpacing","chromeColor","rollOverColor","fontSize","baselineShift","focusedTextSelectionColor","paragraphEndIndent","fontWeight","breakOpportunity","leading","renderingMode","symbolColor","fontSharpness","barColor","modalTransparencyDuration","paragraphStartIndent","justificationStyle","layoutDirection","footerColors","wordSpacing","listStyleType","contentBackgroundColor","paragraphSpaceAfter","contentBackgroundAlpha","textRotation","fontAntiAliasType","cffHinting","direction","errorColor","locale","digitWidth","backgroundDisabledColor","modalTransparencyColor","ligatureLevel","touchDelay","firstBaselineOffset","textIndent","clearFloats","themeColor","tabStops","fontLookup","modalTransparency","paragraphSpaceBefore","headerColors","textAlign","fontFamily","textSelectedColor","lineThrough","interactionMode","whiteSpaceCollapse","fontGridFitType","alignmentBaseline","trackingLeft","fontStyle","dropShadowColor","accentColor","selectionColor","disabledColor","modalTransparencyBlur","downColor","textJustify","focusColor","color","alternatingItemColors","typographicCase"];
         var i:int = 0;
         while(i < styleNames.length)
         {
            styleManager.registerInheritingStyle(styleNames[i]);
            i++;
         }
      }
   }
}
