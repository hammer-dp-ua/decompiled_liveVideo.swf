package common.sdk
{
   import common.logic.includes.GeneralError;
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   import flash.xml.XMLDocument;
   
   public class ParserXML
   {
       
      
      private var m_objXMLDocument:XMLDocument = null;
      
      private var m_objPropertyMap:Map = null;
      
      public function ParserXML(param1:XMLDocument = null)
      {
         super();
         this.m_objPropertyMap = new Map(Map.MAP_TYPE_STR,Map.MAP_TYPE_STR);
         this.m_objXMLDocument = param1;
      }
      
      public function parser(param1:XMLDocument) : int
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         this.m_objXMLDocument = param1;
         var _loc2_:String = this.m_objXMLDocument.firstChild.nodeName;
         if(_loc2_ != "Language")
         {
            return -1;
         }
         var _loc3_:XMLDocument = null;
         var _loc4_:int = this.m_objXMLDocument.firstChild.childNodes.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = this.m_objXMLDocument.firstChild.childNodes[_loc5_];
            if(null != _loc6_ && _loc6_.indexOf("<") != -1)
            {
               _loc3_ = new XMLDocument(_loc6_);
               _loc7_ = _loc3_.firstChild.attributes.id;
               _loc8_ = _loc3_.firstChild.attributes.name;
               if(!(_loc7_ == undefined || _loc8_ == undefined))
               {
                  this.m_objPropertyMap.push(_loc7_,_loc8_);
               }
            }
            _loc5_++;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function getNameById(param1:String) : String
      {
         var _loc2_:KeyValuePair = this.m_objPropertyMap.find(param1);
         if(_loc2_ == null)
         {
            return "";
         }
         return _loc2_.Value;
      }
      
      public function addElement(param1:String, param2:String) : void
      {
         this.m_objPropertyMap.push(param1,param2);
      }
   }
}
