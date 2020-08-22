package common.service.util
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class LoadingXML
   {
       
      
      private var m_objURLLoader:URLLoader = null;
      
      private var m_iResult:int;
      
      private var m_strRequestContent:String;
      
      public function LoadingXML()
      {
         super();
         this.m_strRequestContent = "";
         this.m_objURLLoader = new URLLoader();
         this.m_iResult = 0;
      }
      
      public function loaderXML(param1:String) : void
      {
         var objURLRequest:URLRequest = null;
         var p_strXMLFilePath:String = param1;
         try
         {
            if(p_strXMLFilePath == null || p_strXMLFilePath.length == 0)
            {
               return;
            }
            objURLRequest = new URLRequest(p_strXMLFilePath);
            this.m_objURLLoader.load(objURLRequest);
            return;
         }
         catch(event:SecurityError)
         {
            m_iResult = -1;
            return;
         }
      }
      
      public function getRequestContent() : String
      {
         return this.m_strRequestContent;
      }
      
      public function getResult() : int
      {
         return this.m_iResult;
      }
      
      public function addDefaultEventListener() : void
      {
         this.m_objURLLoader.addEventListener(Event.COMPLETE,this.complete_EventHandler);
         this.m_objURLLoader.addEventListener(IOErrorEvent.IO_ERROR,this.ioError_EventHandler);
         this.m_objURLLoader.addEventListener(ProgressEvent.PROGRESS,this.progress_EventHandler);
      }
      
      public function ioError_EventHandler(param1:IOErrorEvent) : void
      {
         this.m_iResult = -1;
      }
      
      public function open_EventHandler(param1:Event) : void
      {
      }
      
      public function complete_EventHandler(param1:Event) : void
      {
         this.m_strRequestContent = this.m_objURLLoader.data;
      }
      
      public function progress_EventHandler(param1:ProgressEvent) : void
      {
      }
   }
}
