package common.service.util
{
   public class KeyValuePair
   {
       
      
      private var m_objKey;
      
      private var m_objValue;
      
      public function KeyValuePair()
      {
         super();
      }
      
      public function compareName(param1:*) : int
      {
         if(param1 is int)
         {
            if(this.m_objKey == param1)
            {
               return 0;
            }
            return -1;
         }
         if(param1 is String)
         {
            return this.m_objKey.localeCompare(param1);
         }
         return -1;
      }
      
      public function set Key(param1:*) : void
      {
         this.m_objKey = param1;
      }
      
      public function get Key() : *
      {
         return this.m_objKey;
      }
      
      public function set Value(param1:*) : void
      {
         this.m_objValue = param1;
      }
      
      public function get Value() : *
      {
         return this.m_objValue;
      }
   }
}
