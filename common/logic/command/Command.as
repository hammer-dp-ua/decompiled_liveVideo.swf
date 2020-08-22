package common.logic.command
{
   import common.logic.includes.CharSetType;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class Command
   {
      
      private static var m_byCharSet:ByteArray;
       
      
      private var m_objCommandHead:CommandHead;
      
      public function Command()
      {
         super();
         m_byCharSet = new ByteArray();
         m_byCharSet.length = 1;
         m_byCharSet.writeByte(CharSetType.CHAR_SET_GB2312);
         m_byCharSet.position = 0;
         this.m_objCommandHead = new CommandHead();
         this.m_objCommandHead.CharSet = m_byCharSet;
      }
      
      public function setCommandId(param1:int) : void
      {
         this.m_objCommandHead.CommandId = param1;
      }
      
      public function getCommondId() : int
      {
         return this.m_objCommandHead.CommandId;
      }
      
      public function set Version(param1:ByteArray) : void
      {
         this.m_objCommandHead.Version = param1;
      }
      
      public function get Version() : ByteArray
      {
         return this.m_objCommandHead.Version;
      }
      
      public function setSourceId(param1:ByteArray, param2:int) : Boolean
      {
         return this.m_objCommandHead.setSourceId(param1,param2);
      }
      
      public function getSourceId(param1:int) : ByteArray
      {
         return this.m_objCommandHead.getSourceId(param1);
      }
      
      public function setDestId(deviceIdParam:ByteArray, bytesAvailableParam:int) : Boolean
      {
         return this.m_objCommandHead.setDestId(deviceIdParam, bytesAvailableParam);
      }
      
      public function getDestId(param1:int) : ByteArray
      {
         return this.m_objCommandHead.getDestId(param1);
      }
      
      public function setPayloadLength(param1:int) : void
      {
         this.m_objCommandHead.PayloadLength = param1;
      }
      
      public function getPayloadLength() : int
      {
         return this.m_objCommandHead.PayloadLength;
      }
      
      public function getMaxLength() : int
      {
         return CommonConst.CONST_MAXLENGTH_COMMAND;
      }
      
      public function getPayloadMaxLength() : int
      {
         return CommonConst.CONST_MAXLENGTH_COMMAND_PAYLOAD;
      }
      
      public function getCommandHead(param1:Buffer) : int
      {
         return this.m_objCommandHead.getCommandHead(param1);
      }
      
      public function set CharSet(param1:ByteArray) : void
      {
         m_byCharSet = param1;
      }
      
      public function getCommandCharSet() : ByteArray
      {
         return this.m_objCommandHead.CharSet;
      }
      
      public function parseCommandHead(... rest) : int
      {
         if(rest.length == 1)
         {
            if(rest[0] is Buffer)
            {
               return this.m_objCommandHead.parseCommandHead(rest[0]);
            }
         }
         else if(rest.length == 2)
         {
            if(rest[0] is ByteArray && rest[1] is int)
            {
               return this.m_objCommandHead.parseCommandHead(rest[0],rest[1]);
            }
         }
         return GeneralError.SN_ERROR_INVALID_FUNCTION;
      }
   }
}
