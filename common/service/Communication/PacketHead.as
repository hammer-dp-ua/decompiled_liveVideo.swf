package common.service.Communication
{
   import common.logic.includes.GeneralError;
   import common.logic.includes.NetworkIOError;
   import common.logic.share.CommonConst;
   import flash.utils.ByteArray;
   
   public class PacketHead
   {
      
      public static const CONST_COMPRESS_ENABLE_FLAG:int = 1;
      
      public static const CONST_ENCRYPT_ENABLE_FLAG:int = 2;
       
      
      private var m_byMagic:ByteArray;
      
      private var m_byVersion:ByteArray;
      
      private var m_iSeq:uint;
      
      private var m_iAck:uint;
      
      private var m_byFlag:ByteArray;
      
      private var m_iOffset:uint;
      
      private var m_iSessionId:int;
      
      private var m_sReserve:String;
      
      private var m_iPayloadLength:int;
      
      public function PacketHead()
      {
         super();
         this.m_byMagic = new ByteArray();
         this.m_byMagic.length = 1;
         this.m_byMagic.writeByte(255);
         this.m_byMagic.position = 0;
         this.m_byVersion = new ByteArray();
         this.m_byVersion.length = 1;
         this.m_byVersion.writeByte(1);
         this.m_byVersion.position = 0;
         this.m_iSeq = 1;
         this.m_iAck = 1;
         this.m_byFlag = new ByteArray();
         this.m_byFlag.length = 1;
         this.m_byFlag.writeByte(0);
         this.m_byFlag.position = 0;
         this.m_iSessionId = 0;
         this.m_sReserve = "";
         this.m_iPayloadLength = 0;
      }
      
      public function set Magic(param1:ByteArray) : void
      {
         this.m_byMagic = param1;
      }
      
      public function get Magic() : ByteArray
      {
         return this.m_byMagic;
      }
      
      public function set Version(param1:ByteArray) : void
      {
         this.m_byVersion = param1;
      }
      
      public function get Version() : ByteArray
      {
         return this.m_byVersion;
      }
      
      public function set Seq(param1:uint) : void
      {
         this.m_iSeq = param1;
      }
      
      public function get Seq() : uint
      {
         return this.m_iSeq;
      }
      
      public function set Ack(param1:uint) : void
      {
         this.m_iAck = param1;
      }
      
      public function get Ack() : uint
      {
         return this.m_iAck;
      }
      
      public function set Flag(param1:ByteArray) : void
      {
         this.m_byFlag = param1;
      }
      
      public function get Flag() : ByteArray
      {
         return this.m_byFlag;
      }
      
      public function get Offset() : uint
      {
         return this.m_iOffset;
      }
      
      public function set Offset(param1:uint) : void
      {
         this.m_iOffset = param1;
      }
      
      public function setCompressFlag(param1:Boolean) : void
      {
         var _loc2_:* = 0;
         if(param1)
         {
            _loc2_ = this.m_byFlag.readByte() | CONST_COMPRESS_ENABLE_FLAG;
            this.m_byFlag.clear();
            this.m_byFlag.writeByte(_loc2_);
            this.m_byFlag.position = 0;
         }
         else
         {
            _loc2_ = this.m_byFlag.readByte() & ~CONST_COMPRESS_ENABLE_FLAG;
            this.m_byFlag.clear();
            this.m_byFlag.writeByte(_loc2_);
            this.m_byFlag.position = 0;
         }
      }
      
      public function getCompressFlag() : Boolean
      {
         if((this.m_byFlag.readByte() & CONST_COMPRESS_ENABLE_FLAG) == CONST_COMPRESS_ENABLE_FLAG)
         {
            return true;
         }
         return false;
      }
      
      public function setEncryptFlag(param1:Boolean) : void
      {
         var _loc2_:* = 0;
         if(param1)
         {
            _loc2_ = this.m_byFlag.readByte() | CONST_ENCRYPT_ENABLE_FLAG;
            this.m_byFlag.clear();
            this.m_byFlag.writeByte(_loc2_);
         }
         else
         {
            _loc2_ = this.m_byFlag.readByte() & ~CONST_ENCRYPT_ENABLE_FLAG;
            this.m_byFlag.clear();
            this.m_byFlag.writeByte(_loc2_);
         }
      }
      
      public function getEncryptFlag() : Boolean
      {
         if((this.m_byFlag.readByte() & CONST_ENCRYPT_ENABLE_FLAG) == CONST_ENCRYPT_ENABLE_FLAG)
         {
            return true;
         }
         return false;
      }
      
      public function set SessionId(param1:int) : void
      {
         this.m_iSessionId = param1;
      }
      
      public function get SessionId() : int
      {
         return this.m_iSessionId;
      }
      
      public function setReserve(param1:String, param2:uint) : Boolean
      {
         if(param1 == null || param2 > CommonConst.CONST_LENGTH_PACKET_RESERVE)
         {
            return false;
         }
         this.m_sReserve = param1;
         return true;
      }
      
      public function getReserve(param1:String, param2:uint) : String
      {
         if(param1 == null)
         {
            return "";
         }
         var _loc3_:uint = param2 < CommonConst.CONST_LENGTH_PACKET_RESERVE?uint(param2):uint(CommonConst.CONST_LENGTH_PACKET_RESERVE);
         return this.m_sReserve.substr(0,_loc3_);
      }
      
      public function set PayloadLength(param1:int) : void
      {
         this.m_iPayloadLength = param1;
      }
      
      public function get PayloadLength() : int
      {
         return this.m_iPayloadLength;
      }
      
      public function getPacketHead() : Buffer
      {
         var resultBuffer:Buffer = new Buffer();
         var statusOk:Boolean = resultBuffer.alloc(CommonConst.CONST_LENGTH_PACKET_HEAD);
         if(!statusOk)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         
         statusOk = resultBuffer.append(this.m_byMagic);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         statusOk = resultBuffer.append(this.m_byVersion);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         statusOk = resultBuffer.append(this.m_iSeq);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         statusOk = resultBuffer.append(this.m_iAck);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         statusOk = resultBuffer.append(this.m_byFlag);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         statusOk = resultBuffer.append(this.m_iOffset);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         var sessionId:ByteArray = new ByteArray();
         sessionId.length = 2;
         sessionId.writeShort(this.m_iSessionId);
         sessionId.position = 0;
         
         statusOk = resultBuffer.append(sessionId);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         statusOk = resultBuffer.append(this.m_sReserve, CommonConst.CONST_LENGTH_PACKET_RESERVE);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         
         statusOk = resultBuffer.append(this.m_iPayloadLength);
         if(!statusOk)
         {
            throw new Error(NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR);
         }
         resultBuffer.getByBuffer().position = 0;
         return resultBuffer;
      }
      
      public function parsePacketHead(... rest) : int
      {
         var _loc2_:ByteArray = null;
         var _loc3_:int = 0;
         var _loc4_:ByteArray = null;
         if(rest.length == 1)
         {
            if(rest[0] is Buffer)
            {
               if(rest[0].getDataLength() < CommonConst.CONST_LENGTH_PACKET_HEAD)
               {
                  return NetworkIOError.SN_ERROR_PACKET_HEAD_PARSE_ERROR;
               }
               this.parsePacketHead(rest[0].getData(),CommonConst.CONST_LENGTH_PACKET_HEAD);
            }
         }
         else if(rest.length == 2)
         {
            if(rest[0] is ByteArray && rest[1] is int)
            {
               if(rest[0] == null)
               {
                  return GeneralError.SN_ERROR_NULL_POINTER;
               }
               if(rest[1] < CommonConst.CONST_LENGTH_PACKET_HEAD)
               {
                  return NetworkIOError.SN_ERROR_PACKET_HEAD_PARSE_ERROR;
               }
               _loc2_ = rest[0];
               _loc2_.position = 0;
               _loc3_ = 0;
               this.m_byMagic.writeByte(_loc2_.readByte());
               _loc3_ = _loc3_ + this.m_byMagic.length;
               this.m_byVersion.writeByte(_loc2_.readByte());
               _loc3_ = _loc3_ + this.m_byVersion.length;
               _loc4_ = new ByteArray();
               _loc4_.writeInt(_loc2_.readInt());
               _loc4_.position = 0;
               _loc3_ = _loc3_ + _loc4_.length;
               this.m_iSeq = _loc4_.readInt();
               _loc4_ = new ByteArray();
               _loc4_.writeInt(_loc2_.readInt());
               _loc4_.position = 0;
               _loc3_ = _loc3_ + _loc4_.length;
               this.m_iAck = _loc4_.readInt();
               this.m_byFlag.writeByte(_loc2_.readByte());
               _loc3_ = _loc3_ + this.m_byFlag.length;
               _loc4_ = new ByteArray();
               _loc4_.writeInt(_loc2_.readInt());
               _loc4_.position = 0;
               _loc3_ = _loc3_ + _loc4_.length;
               this.m_iOffset = _loc4_.readInt();
               _loc4_ = new ByteArray();
               _loc4_.writeShort(_loc2_.readShort());
               _loc4_.position = 0;
               _loc3_ = _loc3_ + _loc4_.length;
               this.m_iSessionId = _loc4_.readShort();
               this.m_sReserve = _loc2_.readMultiByte(CommonConst.CONST_LENGTH_PACKET_RESERVE,CommonConst.SOCKET_DATA_ENCODE_GB);
               _loc3_ = _loc3_ + CommonConst.CONST_LENGTH_PACKET_RESERVE;
               this.m_iPayloadLength = _loc2_.readInt();
               return GeneralError.SN_SUCCESS;
            }
         }
         return GeneralError.SN_ERROR_INVALID_FUNCTION;
      }
   }
}
