package common.logic.command
{
   import common.logic.includes.CommandError;
   import common.logic.includes.GeneralError;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class SessionHeartbeatCommand extends Command
   {
       
      
      private var m_iSessionId:int;
      
      public function SessionHeartbeatCommand()
      {
         super();
         setCommandId(CommandConst.CONST_COMMANDID_SESSION_HEARTBEAT);
      }
      
      public function set SessionId(param1:int) : void
      {
         this.m_iSessionId = param1;
      }
      
      public function get SessionId() : int
      {
         return this.m_iSessionId;
      }
      
      public function getCommand(commandParam:Buffer) : int
      {
         var sessionId:ByteArray = new ByteArray();
         sessionId.writeShort(1);
         sessionId.position = 0;
         var sessionIdLength:int = sessionId.length;
         var sumLength:int = CommandHead.getLength() + sessionIdLength;
         var statusOk:Boolean = commandParam.alloc(sumLength);
         if(!statusOk)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         var commandHead:Buffer = new Buffer();
         setPayloadLength(sessionIdLength);
         
         var commandHeadStatus:int = getCommandHead(commandHead);
         if(commandHeadStatus != GeneralError.SN_SUCCESS)
         {
            return commandHeadStatus;
         }
         
         statusOk = commandParam.append(commandHead);
         if(!statusOk)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         sessionId.clear();
         sessionId.writeShort(this.m_iSessionId);
         sessionId.position = 0;
         
         statusOk = commandParam.append(sessionId);
         if(!statusOk)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function parseCommand(param1:Buffer) : int
      {
         var _loc2_:int = parseCommandHead(param1);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         if(getCommondId() != CommandConst.CONST_COMMANDID_SESSION_HEARTBEAT)
         {
            return CommandError.SN_ERROR_COMMAND_UNKNOW;
         }
         if(getPayloadLength() < param1.getDataLength() - CommandHead::getLength())
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         var _loc3_:ByteArray = param1.getData();
         _loc3_.position = 0;
         this.m_iSessionId = _loc3_.readShort();
         return GeneralError.SN_SUCCESS;
      }
   }
}
