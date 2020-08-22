package common.logic.component
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import mx.core.IUIComponent;
   import mx.managers.ISystemManager;
   
   public class DisplaySprite extends Sprite implements IUIComponent
   {
       
      
      public function DisplaySprite()
      {
         super();
      }
      
      public function get baselinePosition() : Number
      {
         return 0;
      }
      
      public function get document() : Object
      {
         return null;
      }
      
      public function set document(param1:Object) : void
      {
      }
      
      public function get enabled() : Boolean
      {
         return false;
      }
      
      public function set enabled(param1:Boolean) : void
      {
      }
      
      public function get explicitHeight() : Number
      {
         return 0;
      }
      
      public function set explicitHeight(param1:Number) : void
      {
      }
      
      public function get explicitMaxHeight() : Number
      {
         return 0;
      }
      
      public function get explicitMaxWidth() : Number
      {
         return 0;
      }
      
      public function get explicitMinHeight() : Number
      {
         return 0;
      }
      
      public function get explicitMinWidth() : Number
      {
         return 0;
      }
      
      public function get explicitWidth() : Number
      {
         return 0;
      }
      
      public function set explicitWidth(param1:Number) : void
      {
      }
      
      public function get focusPane() : Sprite
      {
         return null;
      }
      
      public function set focusPane(param1:Sprite) : void
      {
      }
      
      public function get includeInLayout() : Boolean
      {
         return false;
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
      }
      
      public function get isPopUp() : Boolean
      {
         return false;
      }
      
      public function set isPopUp(param1:Boolean) : void
      {
      }
      
      public function get maxHeight() : Number
      {
         return 0;
      }
      
      public function get maxWidth() : Number
      {
         return 0;
      }
      
      public function get measuredMinHeight() : Number
      {
         return 0;
      }
      
      public function set measuredMinHeight(param1:Number) : void
      {
      }
      
      public function get measuredMinWidth() : Number
      {
         return 0;
      }
      
      public function set measuredMinWidth(param1:Number) : void
      {
      }
      
      public function get minHeight() : Number
      {
         return 0;
      }
      
      public function get minWidth() : Number
      {
         return 0;
      }
      
      public function get owner() : DisplayObjectContainer
      {
         return null;
      }
      
      public function set owner(param1:DisplayObjectContainer) : void
      {
      }
      
      public function get percentHeight() : Number
      {
         return 0;
      }
      
      public function set percentHeight(param1:Number) : void
      {
      }
      
      public function get percentWidth() : Number
      {
         return 0;
      }
      
      public function set percentWidth(param1:Number) : void
      {
      }
      
      public function get systemManager() : ISystemManager
      {
         return null;
      }
      
      public function set systemManager(param1:ISystemManager) : void
      {
      }
      
      public function get tweeningProperties() : Array
      {
         return null;
      }
      
      public function set tweeningProperties(param1:Array) : void
      {
      }
      
      public function initialize() : void
      {
      }
      
      public function parentChanged(param1:DisplayObjectContainer) : void
      {
      }
      
      public function getExplicitOrMeasuredWidth() : Number
      {
         return 0;
      }
      
      public function getExplicitOrMeasuredHeight() : Number
      {
         return 0;
      }
      
      public function setVisible(param1:Boolean, param2:Boolean = false) : void
      {
      }
      
      public function owns(param1:DisplayObject) : Boolean
      {
         return false;
      }
      
      public function get measuredHeight() : Number
      {
         return 0;
      }
      
      public function get measuredWidth() : Number
      {
         return 0;
      }
      
      public function move(param1:Number, param2:Number) : void
      {
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
      }
   }
}
