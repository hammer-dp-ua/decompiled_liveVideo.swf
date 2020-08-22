package common.service.util
{
   public class Map
   {
      
      public static const MAP_TYPE_INT:int = 1;
      
      public static const MAP_TYPE_STR:int = 2;
       
      
      private var m_iKeyType:int;
      
      private var m_iValueType:int;
      
      private var m_objDataMap:Vector.<KeyValuePair>;
      
      public function Map(param1:int, param2:int)
      {
         super();
         this.m_iKeyType = param1;
         this.m_iValueType = param2;
         this.m_objDataMap = new Vector.<KeyValuePair>();
      }
      
      public function getDataMap() : Vector.<KeyValuePair>
      {
         return this.m_objDataMap;
      }
      
      public function get Size() : int
      {
         return this.m_objDataMap.length;
      }
      
      public function findByIndex(param1:uint) : KeyValuePair
      {
         if(param1 < 0 || param1 >= this.m_objDataMap.length)
         {
            return null;
         }
         return this.m_objDataMap[param1];
      }
      
      public function push(param1:*, param2:*) : Boolean
      {
         if(!(this.checkKeyType(param1) && this.checkValueType(param2)))
         {
            return false;
         }
         var _loc3_:KeyValuePair = new KeyValuePair();
         _loc3_.Key = param1;
         _loc3_.Value = param2;
         this.m_objDataMap.push(_loc3_);
         return true;
      }
      
      private function checkKeyType(param1:*) : Boolean
      {
         if(this.m_iKeyType == MAP_TYPE_INT)
         {
            if(param1 is int)
            {
               return true;
            }
         }
         else if(this.m_iKeyType == MAP_TYPE_STR)
         {
            if(param1 is String)
            {
               return true;
            }
         }
         return false;
      }
      
      private function checkValueType(param1:*) : Boolean
      {
         if(this.m_iValueType == MAP_TYPE_INT)
         {
            if(param1 is int)
            {
               return true;
            }
         }
         else if(this.m_iValueType == MAP_TYPE_STR)
         {
            if(param1 is String)
            {
               return true;
            }
         }
         return false;
      }
      
      public function pop() : KeyValuePair
      {
         return this.m_objDataMap.pop();
      }
      
      public function find(param1:*) : KeyValuePair
      {
         var _loc3_:* = null;
         var _loc4_:KeyValuePair = null;
         if(!this.checkKeyType(param1))
         {
            return null;
         }
         var _loc2_:KeyValuePair = null;
         for(_loc3_ in this.m_objDataMap)
         {
            _loc4_ = this.m_objDataMap[_loc3_];
            if(_loc4_.compareName(param1) == 0)
            {
               _loc2_ = _loc4_;
               break;
            }
         }
         return _loc2_;
      }
   }
}
