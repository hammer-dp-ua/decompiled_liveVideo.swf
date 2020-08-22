package common.sdk
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.xml.XMLDocument;
   
   public class LanguageXMLManager
   {
       
      
      private var m_objURLLoader:URLLoader = null;
      
      private var m_strXMLFilePath:String = "";
      
      private var m_objXMLDocument:XMLDocument = null;
      
      private var m_strResultInfo:String = "SUCCESS";
      
      private var m_objParserXML:ParserXML = null;
      
      private var m_iLanguageId:int;
      
      private var m_iFileNameType:int;
      
      private var objXML:XML;
      
      private var m_completeFlag:int = 0;
      
      public function LanguageXMLManager(param1:int, param2:int = 1)
      {
         super();
         this.m_objParserXML = new ParserXML();
         this.m_objURLLoader = new URLLoader();
         this.addDefaultEventListener();
         this.m_iLanguageId = param2;
         this.m_iFileNameType = param1;
      }
      
      public function getURLLoader() : URLLoader
      {
         return this.m_objURLLoader;
      }
      
      private function addDefaultEventListener() : void
      {
         this.m_objURLLoader.addEventListener(Event.COMPLETE,this.complete_EventHandler);
         this.m_objURLLoader.addEventListener(IOErrorEvent.IO_ERROR,this.ioError_EventHandler);
         this.m_objURLLoader.addEventListener(ProgressEvent.PROGRESS,this.progress_EventHandler);
      }
      
      public function loaderXML() : void
      {
         this.m_strXMLFilePath = LanguageConst.FileName(this.m_iFileNameType,this.m_iLanguageId);
         var objURLRequest:URLRequest = new URLRequest(this.m_strXMLFilePath);
         try
         {
            this.m_objURLLoader.load(objURLRequest);
            return;
         }
         catch(event:SecurityError)
         {
            m_strResultInfo = "SecurityError: " + event.message;
            return;
         }
      }
      
      public function ioError_EventHandler(param1:IOErrorEvent) : void
      {
         this.m_strResultInfo = param1.text + ", File may be not exist!";
      }
      
      public function open_EventHandler(param1:Event) : void
      {
      }
      
      public function complete_EventHandler(param1:Event) : void
      {
         this.m_completeFlag = 1;
         this.objXML = new XML(this.m_objURLLoader.data);
         this.m_objXMLDocument = new XMLDocument(this.objXML.toString());
         this.m_objParserXML.parser(this.m_objXMLDocument);
      }
      
      public function progress_EventHandler(param1:ProgressEvent) : void
      {
      }
      
      public function resultInfo() : String
      {
         return this.m_strResultInfo;
      }
      
      public function getNameById(param1:String) : String
      {
         return this.m_objParserXML.getNameById(param1);
      }
      
      public function get completeFlag() : int
      {
         return this.m_completeFlag;
      }
   }
}
