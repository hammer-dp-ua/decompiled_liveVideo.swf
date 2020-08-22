package common.logic.sensor.component
{
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.styleparser.WndConfig;
   import common.logic.sensor.util.SensorTool;
   import common.service.util.Map;
   import flash.geom.Rectangle;
   import spark.components.RadioButton;
   
   public class RadioButtonWnd extends Wnd
   {
       
      
      private var m_objRadioButton:RadioButton;
      
      private var m_iIndex:int;
      
      private var m_objShowWndList:Vector.<int>;
      
      private var m_objEnableWndList:Vector.<int>;
      
      public function RadioButtonWnd()
      {
         super();
      }
      
      override public function UpdateValue(param1:Map) : int
      {
         return 0;
      }
      
      override public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         var _loc3_:Rectangle = null;
         if(!getPosition(param1,param2,_loc3_))
         {
            throw "Radiobutton position failed";
         }
         var _loc4_:String = getWndName(param2);
         if(null == _loc4_)
         {
            throw "Radiobutton has no wnd name";
         }
         this.m_objRadioButton = new RadioButton();
         this.m_objRadioButton.setLayoutBoundsPosition(_loc3_.x - param1.getRealWnd().x,_loc3_.y - -param1.getRealWnd().y);
         this.m_objRadioButton.setLayoutBoundsSize(_loc3_.width,_loc3_.height);
         this.m_objRadioButton.id = new String(0);
         this.m_iIndex = int(param2.getProperty(Wnd_Property.WND_INDEX));
         if(-1 == this.m_iIndex)
         {
            throw "ComboItem has no property index";
         }
         var _loc5_:String = param2.getProperty(Wnd_Property.WND_SHOWLIST);
         if(null != _loc5_)
         {
            this.m_objShowWndList = SensorTool.parseShowID(_loc5_);
         }
         var _loc6_:String = param2.getProperty(Wnd_Property.WND_ENABLELIST);
         if(null != _loc6_)
         {
            this.m_objEnableWndList = SensorTool.parseShowID(_loc6_);
         }
         return 0;
      }
   }
}
