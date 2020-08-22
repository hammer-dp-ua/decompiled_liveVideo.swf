package common.logic.domain
{
   import flash.utils.ByteArray;
   
   public class User
   {
       
      
      private var m_bySourceId:ByteArray;
      
      private var m_byHostOrderIP:ByteArray;
      
      private var m_iPort:int = 0;
      
      private var m_byUserName:ByteArray;
      
      private var m_byPassword:ByteArray;
      
      public function User()
      {
         super();
         this.m_bySourceId = new ByteArray();
         this.m_bySourceId.length = common.logic.share.CommonConst.CONST_LENGTH_COMMAND_SOURCEID;
         this.m_byHostOrderIP = new ByteArray();
         this.m_byHostOrderIP.length = DomainConst.CONST_MAXLENGTH_IP;
         this.m_byUserName = new ByteArray();
         this.m_byUserName.length = DomainConst.CONST_MAXLENGTH_USERNAME;
         this.m_byPassword = new ByteArray();
         this.m_byPassword.length = DomainConst.CONST_MAXLENGTH_USERPASSWORD;
      }
      
      public function set SourceId(param1:ByteArray) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.length > this.m_bySourceId.length)
         {
            return;
         }
         this.m_bySourceId = param1;
         this.m_bySourceId.position = 0;
         this.m_bySourceId.length = common.logic.share.CommonConst.CONST_LENGTH_COMMAND_SOURCEID;
      }
      
      public function get SourceId() : ByteArray
      {
         return this.m_bySourceId;
      }
      
      public function set IP(param1:ByteArray) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.length > this.m_byHostOrderIP.length)
         {
            return;
         }
         this.m_byHostOrderIP = param1;
         this.m_byHostOrderIP.position = 0;
         this.m_byHostOrderIP.length = DomainConst.CONST_MAXLENGTH_IP;
      }
      
      public function get IP() : ByteArray
      {
         return this.m_byHostOrderIP;
      }
      
      public function set Port(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         _loc2_.position = 0;
         this.m_iPort = _loc2_.readShort();
      }
      
      public function get Port() : int
      {
         return this.m_iPort;
      }
      
      public function set UserName(param1:ByteArray) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.length > this.m_byUserName.length)
         {
            return;
         }
         this.m_byUserName = param1;
         this.m_byUserName.position = 0;
         this.m_byUserName.length = DomainConst.CONST_MAXLENGTH_USERNAME;
      }
      
      public function get UserName() : ByteArray
      {
         return this.m_byUserName;
      }
      
      public function set Password(param1:ByteArray) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.length > this.m_byPassword.length)
         {
            return;
         }
         this.m_byPassword = param1;
         this.m_byPassword.position = 0;
         this.m_byPassword.length = DomainConst.CONST_MAXLENGTH_USERPASSWORD;
      }
      
      public function get Password() : ByteArray
      {
         return this.m_byPassword;
      }
   }
}
