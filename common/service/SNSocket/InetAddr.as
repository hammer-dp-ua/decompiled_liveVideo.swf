package common.service.SNSocket
{
   import flash.utils.ByteArray;
   
   public class InetAddr
   {
       
      
      private var m_byHostIP:ByteArray;
      
      private var m_iPort:uint;
      
      private var m_iIPProtoVer:int;
      
      public function InetAddr()
      {
         super();
         this.m_byHostIP = new ByteArray();
         this.m_byHostIP.length = SNSocketConst.MAXLENGTH_IP + 1;
         this.m_iPort = 1;
         this.m_iIPProtoVer = 1;
      }
      
      public function setIP(param1:ByteArray) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param1.length > this.m_byHostIP.length)
         {
            return false;
         }
         this.m_byHostIP = param1;
         this.m_byHostIP.length = SNSocketConst.MAXLENGTH_IP + 1;
         this.m_byHostIP.position = 0;
         return true;
      }
      
      public function setPosHostIp() : void
      {
         this.m_byHostIP.position = 0;
      }
      
      public function getIP() : ByteArray
      {
         return this.m_byHostIP;
      }
      
      public function set Port(param1:uint) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUnsignedInt(param1);
         _loc2_.position = 0;
         this.m_iPort = _loc2_.readUnsignedInt();
      }
      
      public function get Port() : uint
      {
         return this.m_iPort;
      }
      
      public function set IPProtoVer(param1:int) : void
      {
         this.m_iIPProtoVer = param1;
      }
      
      public function get IPProtoVer() : int
      {
         return this.m_iIPProtoVer;
      }
   }
}
