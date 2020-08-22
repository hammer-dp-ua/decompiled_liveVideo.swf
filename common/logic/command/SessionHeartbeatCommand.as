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
      
      public function getCommand(param1:Buffer) : int
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(1);
         _loc2_.position = 0;
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = CommandHead.getLength() + _loc3_;
         var _loc5_:Boolean = param1.alloc(_loc4_);
         if(!_loc5_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         var _loc6_:Buffer = new Buffer();
         setPayloadLength(_loc3_);
         var _loc7_:int = getCommandHead(_loc6_);
         if(_loc7_ != GeneralError.SN_SUCCESS)
         {
            return _loc7_;
         }
         _loc5_ = param1.append(_loc6_);
         if(!_loc5_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         _loc2_.clear();
         _loc2_.writeShort(this.m_iSessionId);
         _loc2_.position = 0;
         _loc5_ = param1.append(_loc2_);
         if(!_loc5_)
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
