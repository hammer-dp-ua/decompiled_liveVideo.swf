package common.service.SNSocket
{
   import flash.net.Socket;
   import flash.utils.ByteArray;
   
   public class TCPSocket extends Socket
   {
       
      
      private var m_sServerHost:String;
      
      private var m_iServerPort:uint;
      
      private var m_bFlag:Boolean;
      
      public var count:int = 0;
      
      public function TCPSocket(param1:String = null, param2:uint = 0)
      {
         this.m_sServerHost = param1;
         this.m_iServerPort = param2;
         this.m_bFlag = false;
         super();
      }
      
      public function open() : void
      {
      }
      
      public function sendData(param1:ByteArray) : Boolean
      {
         if(!this.connected)
         {
            return false;
         }
         this.writeBytes(param1,0,param1.length);
         this.flush();
         this.readMultiByte(this.bytesAvailable,"GB2312");
         return true;
      }
      
      public function connectTo(param1:String, param2:uint) : void
      {
         this.m_sServerHost = param1;
         this.m_iServerPort = param2;
         connect(this.m_sServerHost,this.m_iServerPort);
      }
      
      public function isConnected() : Boolean
      {
         return this.connected;
      }
      
      public function get ServerHost() : String
      {
         return this.m_sServerHost;
      }
      
      public function get Flag() : Boolean
      {
         return this.m_bFlag;
      }
      
      public function set Flag(param1:Boolean) : void
      {
         this.m_bFlag = param1;
      }
      
      public function get ServerPort() : uint
      {
         return this.m_iServerPort;
      }
   }
}
