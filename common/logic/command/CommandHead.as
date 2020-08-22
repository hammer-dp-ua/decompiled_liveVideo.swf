package common.logic.command
{
   import common.logic.includes.CommandError;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class CommandHead
   {
       
      
      private var m_iCommandId:int;
      
      private var m_byVersion:ByteArray;
      
      private var m_bySourceId:ByteArray;
      
      private var m_byDestId:ByteArray;
      
      private var m_byCharSet:ByteArray;
      
      private var m_byReserve:ByteArray;
      
      private var m_iPayloadLength:int;
      
      public function CommandHead()
      {
         super();
         this.m_bySourceId = new ByteArray();
         this.m_bySourceId.length = CommonConst.CONST_LENGTH_COMMAND_SOURCEID;
         this.m_byVersion = new ByteArray();
         this.m_byVersion.length = 1;
         this.m_byVersion.writeByte(1);
         this.m_byVersion.position = 0;
         this.m_byDestId = new ByteArray();
         this.m_byDestId.length = CommonConst.CONST_LENGTH_COMMAND_DESTID;
         this.m_byReserve = new ByteArray();
         this.m_byReserve.length = CommonConst.CONST_LENGTH_COMMAND_RESERVE;
         this.m_byCharSet = new ByteArray();
         this.m_byCharSet.length = 1;
      }
      
      public static function getLength() : int
      {
         return CommonConst.CONST_LENGTH_COMMAND_HEAD;
      }
      
      public function set CommandId(param1:int) : void
      {
         this.m_iCommandId = param1;
      }
      
      public function get CommandId() : int
      {
         return this.m_iCommandId;
      }
      
      public function set Version(param1:ByteArray) : void
      {
         this.m_byVersion = param1;
      }
      
      public function get Version() : ByteArray
      {
         return this.m_byVersion;
      }
      
      public function setSourceId(param1:ByteArray, param2:int) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = param2 > CommonConst.CONST_LENGTH_COMMAND_SOURCEID ? int(CommonConst.CONST_LENGTH_COMMAND_SOURCEID) : int(param2);
         this.m_bySourceId.writeBytes(param1, 0, _loc3_);
         this.m_bySourceId.length = CommonConst.CONST_LENGTH_COMMAND_SOURCEID;
         this.m_bySourceId.position = 0;
         return true;
      }
      
      public function getSourceId(param1:int) : ByteArray
      {
         var _loc2_:int = param1 > CommonConst.CONST_LENGTH_COMMAND_SOURCEID ? int(CommonConst.CONST_LENGTH_COMMAND_SOURCEID) : int(param1);
         return this.m_bySourceId;
      }
      
      public function setDestId(deviceIdParam:ByteArray, bytesAvailableParam:int) : Boolean
      {
         if(deviceIdParam == null)
         {
            return false;
         }
         
         var toBeWrittenLength:int = bytesAvailableParam > CommonConst.CONST_LENGTH_COMMAND_DESTID ? int(CommonConst.CONST_LENGTH_COMMAND_DESTID) : int(bytesAvailableParam);
         this.m_byDestId.writeBytes(deviceIdParam, 0, toBeWrittenLength);
         this.m_byDestId.length = CommonConst.CONST_LENGTH_COMMAND_DESTID;
         this.m_byDestId.position = 0;
         return true;
      }
      
      public function getDestId(param1:int) : ByteArray
      {
         var _loc2_:int = param1 > CommonConst.CONST_LENGTH_COMMAND_DESTID ? int(CommonConst.CONST_LENGTH_COMMAND_DESTID) : int(param1);
         return this.m_byDestId;
      }
      
      public function getCommandHead(bufferParam:Buffer) : int
      {
         var isAllocated:Boolean = bufferParam.alloc(CommandHead.getLength());
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_iCommandId);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_byVersion);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_bySourceId);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_byDestId);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_byCharSet);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_byReserve);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_iPayloadLength);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         bufferParam.getByBuffer().position = 0;
         return GeneralError.SN_SUCCESS;
      }
      
      public function set PayloadLength(param1:int) : void
      {
         this.m_iPayloadLength = param1;
      }
      
      public function get PayloadLength() : int
      {
         return this.m_iPayloadLength;
      }
      
      public function set CharSet(param1:ByteArray) : void
      {
         this.m_byCharSet = param1;
         this.m_byCharSet.length = 1;
         this.m_byCharSet.position = 0;
      }
      
      public function get CharSet() : ByteArray
      {
         return this.m_byCharSet;
      }
      
      public function parseCommandHead(... rest) : int
      {
         var _loc2_:ByteArray = null;
         var _loc4_:ByteArray = null;
         var _loc5_:int = 0;
         var legalParameters:Boolean = false;
         
         if(rest.length == 1)
         {
            if(rest[0] is Buffer)
            {
               if(rest[0].getDataLength() < getLength())
               {
                  return CommandError.SN_ERROR_COMMAND_HEAD_PARSE_ERROR;
               }
               _loc2_ = rest[0].getData();
               _loc2_.position = 0;
               legalParameters = true;
            }
         }
         else if (rest.length == 2)
         {
            if(rest[0] is ByteArray && rest[1] is int)
            {
               if(rest[0] == null)
               {
                  return CommandError.SN_ERROR_COMMAND_HEAD_PARSE_ERROR;
               }
               if(rest[1] < getLength())
               {
                  return CommandError.SN_ERROR_COMMAND_HEAD_PARSE_ERROR;
               }
               _loc2_ = rest[0];
               _loc2_.position = 0;
               legalParameters = true;
            }
         }
         
         if(legalParameters)
         {
            _loc4_ = new ByteArray();
            _loc5_ = 0;
            _loc4_.writeInt(_loc2_.readInt());
            _loc4_.position = 0;
            _loc5_ = _loc5_ + _loc4_.length;
            this.m_iCommandId = _loc4_.readInt();
            this.m_byVersion.writeByte(_loc2_.readByte());
            this.m_byVersion.position = 0;
            _loc5_ = _loc5_ + this.m_byVersion.length;
            this.m_bySourceId.writeMultiByte(_loc2_.readMultiByte(CommonConst.CONST_LENGTH_COMMAND_SOURCEID, CommonConst.SOCKET_DATA_ENCODE_GB), CommonConst.SOCKET_DATA_ENCODE_GB);
            this.m_bySourceId.position = 0;
            _loc5_ = _loc5_ + CommonConst.CONST_LENGTH_COMMAND_SOURCEID;
            this.m_byDestId.writeMultiByte(_loc2_.readMultiByte(CommonConst.CONST_LENGTH_COMMAND_DESTID, CommonConst.SOCKET_DATA_ENCODE_GB), CommonConst.SOCKET_DATA_ENCODE_GB);
            this.m_byDestId.position = 0;
            _loc5_ = _loc5_ + CommonConst.CONST_LENGTH_COMMAND_DESTID;
            this.m_byCharSet.writeByte(_loc2_.readByte());
            this.m_byCharSet.position = 0;
            _loc5_ = _loc5_ + this.m_byCharSet.length;
            this.m_byReserve.writeMultiByte(_loc2_.readMultiByte(CommonConst.CONST_LENGTH_COMMAND_RESERVE, CommonConst.SOCKET_DATA_ENCODE_GB), CommonConst.SOCKET_DATA_ENCODE_GB);
            this.m_byReserve.position = 0;
            _loc5_ = _loc5_ + CommonConst.CONST_LENGTH_COMMAND_RESERVE;
            _loc4_.clear();
            _loc4_.writeInt(_loc2_.readInt());
            _loc4_.position = 0;
            this.m_iPayloadLength = _loc4_.readInt();
            return GeneralError.SN_SUCCESS;
         }
         return GeneralError.SN_ERROR_INVALID_FUNCTION;
      }
   }
}
