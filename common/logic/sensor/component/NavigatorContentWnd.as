package common.logic.sensor.component
{
   import mx.core.UIComponent;
   import spark.components.NavigatorContent;
   
   public class NavigatorContentWnd extends Wnd
   {
       
      
      private var m_objNavigatorContent:NavigatorContent;
      
      public function NavigatorContentWnd()
      {
         super();
         this.m_objNavigatorContent = new NavigatorContent();
      }
      
      override public function getRealWnd() : UIComponent
      {
         return this.m_objNavigatorContent;
      }
      
      override public function setToolTip(param1:String) : void
      {
         this.m_objNavigatorContent.toolTip = param1;
      }
      
      override public function addElement(param1:UIComponent) : void
      {
         this.m_objNavigatorContent.addElement(param1);
      }
      
      override public function setWndName(param1:String) : void
      {
         this.m_objNavigatorContent.label = param1;
      }
      
      override public function RealTime_Handler(param1:int, param2:int, param3:int) : void
      {
         this.getParent().RealTime_Handler(param1,param2,param3);
      }
   }
}
