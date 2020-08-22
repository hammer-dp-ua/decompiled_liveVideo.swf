package common.logic.sensor.languageparser
{
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   
   public class SensorLanguageConfig
   {
       
      
      private var m_WndNameMap:Map;
      
      private var m_HelpInfoMap:Map;
      
      public function SensorLanguageConfig()
      {
         super();
         this.m_WndNameMap = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_STR);
         this.m_HelpInfoMap = new Map(Map.MAP_TYPE_INT,Map.MAP_TYPE_STR);
      }
      
      public function getWndName(param1:int) : String
      {
         var _loc2_:KeyValuePair = this.m_WndNameMap.find(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.Value;
      }
      
      public function getHelpInfo(param1:int) : String
      {
         var _loc2_:KeyValuePair = this.m_HelpInfoMap.find(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.Value;
      }
      
      public function addWndName(param1:int, param2:String) : Boolean
      {
         var _loc3_:KeyValuePair = this.m_HelpInfoMap.find(param1);
         if(_loc3_ == null)
         {
            this.m_WndNameMap.push(param1,param2);
         }
         else
         {
            _loc3_.Value = param2;
         }
         return true;
      }
      
      public function addHelpInfo(param1:int, param2:String) : Boolean
      {
         var _loc3_:KeyValuePair = this.m_HelpInfoMap.find(param1);
         if(_loc3_ == null)
         {
            this.m_HelpInfoMap.push(param1,param2);
         }
         else
         {
            _loc3_.Value = param2;
         }
         return true;
      }
      
      public function getWndNameMap(param1:Map) : Boolean
      {
         param1 = this.m_WndNameMap;
         return true;
      }
      
      public function getHelpInfoMap(param1:Map) : Boolean
      {
         param1 = this.m_HelpInfoMap;
         return true;
      }
   }
}
