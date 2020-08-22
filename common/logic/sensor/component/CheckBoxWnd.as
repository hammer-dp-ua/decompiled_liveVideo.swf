package common.logic.sensor.component
{
   import common.logic.sensor.styleparser.WndConfig;
   import common.service.util.Map;
   import spark.components.CheckBox;
   
   public class CheckBoxWnd extends Wnd
   {
       
      
      private var m_objCheckBox:CheckBox;
      
      public function CheckBoxWnd()
      {
         super();
      }
      
      override public function setToolTip(param1:String) : void
      {
         this.m_objCheckBox.toolTip = param1;
      }
      
      override public function UpdateValue(param1:Map) : int
      {
         return 0;
      }
      
      override public function adjustWndState() : void
      {
      }
      
      override public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         return 0;
      }
   }
}
