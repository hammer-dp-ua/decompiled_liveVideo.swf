package common.logic.sensor.commonparser
{
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   
   public class SensorCommonConfig
   {
       
      
      private var m_strType:String;
      
      private var m_objTipMap:Map;
      
      public function SensorCommonConfig()
      {
         super();
         this.m_objTipMap = new Map(Map.MAP_TYPE_STR,Map.MAP_TYPE_STR);
      }
      
      public function getType() : String
      {
         return this.m_strType;
      }
      
      public function getTipInfo(param1:String) : String
      {
         var _loc2_:KeyValuePair = this.m_objTipMap.find(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.Value;
      }
      
      public function setType(param1:String) : void
      {
         this.m_strType = param1;
      }
      
      public function addTipInfo(param1:String, param2:String) : Boolean
      {
         var _loc3_:KeyValuePair = this.m_objTipMap.find(param1);
         if(_loc3_ == null)
         {
            this.m_objTipMap.push(param1,param2);
         }
         else
         {
            _loc3_.Value = param2;
         }
         return true;
      }
   }
}
