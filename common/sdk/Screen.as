package common.sdk
{
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import spark.components.BorderContainer;
   
   public class Screen extends BorderContainer
   {
       
      
      private var m_bUseFlag:Boolean;
      
      public function Screen()
      {
         super();
         this.m_bUseFlag = false;
      }
      
      public function set useFlag(param1:Boolean) : void
      {
         this.m_bUseFlag = param1;
      }
      
      public function get useFlag() : Boolean
      {
         return this.m_bUseFlag;
      }
      
      public function changeCursorType(param1:*) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
   }
}
