package common.logic.sensor.component
{
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.styleparser.WndConfig;
   import common.logic.sensor.util.SensorTool;
   
   public class ComboBoxItemWnd extends Wnd
   {
       
      
      private var m_iIndex:int;
      
      private var m_strWndName:String;
      
      private var m_objShowWndList:Vector.<int>;
      
      private var m_objEnableWndList:Vector.<int>;
      
      public function ComboBoxItemWnd()
      {
         super();
      }
      
      public function getIndex() : int
      {
         return this.m_iIndex;
      }
      
      public function getShowWndList() : Vector.<int>
      {
         return this.m_objShowWndList;
      }
      
      public function getEnableWndList() : Vector.<int>
      {
         return this.m_objEnableWndList;
      }
      
      public function get WndName() : String
      {
         return this.m_strWndName;
      }
      
      override public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         var _loc3_:String = param2.getProperty(Wnd_Property.WND_INDEX);
         if(null == _loc3_)
         {
            throw new Error("ComboBoxItemWnd has no property index");
         }
         this.m_iIndex = int(_loc3_);
         _loc3_ = param2.getProperty(Wnd_Property.WND_KEY);
         if(null == _loc3_)
         {
            throw new Error("ComboBoxItemWnd has no property key");
         }
         var _loc4_:int = int(_loc3_);
         this.m_strWndName = m_objSensorLanguageConfig.getWndName(_loc4_);
         if(null == this.m_strWndName)
         {
            throw new Error("ComboBoxItemWnd has no name");
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
