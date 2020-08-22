package common.service.Communication
{
   import common.logic.includes.GeneralError;
   import common.logic.includes.NetworkIOError;
   import common.logic.share.CommonConst;
   import flash.utils.ByteArray;
   
   public class Packet
   {
       
      
      private var m_objPacketHead:PacketHead;
      
      private var m_objPayloadBuffer:Buffer;
      
      public function Packet()
      {
         super();
         this.m_objPacketHead = new PacketHead();
         this.m_objPayloadBuffer = new Buffer();
      }
      
      public function set Magic(param1:ByteArray) : void
      {
         this.m_objPacketHead.Magic = param1;
      }
      
      public function get Magic() : ByteArray
      {
         return this.m_objPacketHead.Magic;
      }
      
      public function set Version(param1:ByteArray) : void
      {
         this.m_objPacketHead.Version = param1;
      }
      
      public function get Version() : ByteArray
      {
         return this.m_objPacketHead.Version;
      }
      
      public function set Seq(param1:uint) : void
      {
         this.m_objPacketHead.Seq = param1;
      }
      
      public function get Seq() : uint
      {
         return this.m_objPacketHead.Seq;
      }
      
      public function set Ack(param1:uint) : void
      {
         this.m_objPacketHead.Ack = param1;
      }
      
      public function get Ack() : uint
      {
         return this.m_objPacketHead.Ack;
      }
      
      public function set Flag(param1:ByteArray) : void
      {
         this.m_objPacketHead.Flag = param1;
      }
      
      public function get Flag() : ByteArray
      {
         return this.m_objPacketHead.Flag;
      }
      
      public function get Offset() : uint
      {
         return this.m_objPacketHead.Offset;
      }
      
      public function set Offset(param1:uint) : void
      {
         this.m_objPacketHead.Offset = param1;
      }
      
      public function setCompressFlag(param1:Boolean) : void
      {
         this.m_objPacketHead.setCompressFlag(param1);
      }
      
      public function getCompressFlag() : Boolean
      {
         return this.m_objPacketHead.getCompressFlag();
      }
      
      public function setEncryptFlag(param1:Boolean) : void
      {
         this.m_objPacketHead.setEncryptFlag(param1);
      }
      
      public function getEncryptFlag() : Boolean
      {
         return this.m_objPacketHead.getEncryptFlag();
      }
      
      public function setPacketHead(param1:PacketHead) : void
      {
         this.m_objPacketHead = param1;
      }
      
      public function getPacketHead() : PacketHead
      {
         return this.m_objPacketHead;
      }
      
      public function setSessionId(param1:int) : void
      {
         this.m_objPacketHead.SessionId = param1;
      }
      
      public function getSessionId() : int
      {
         return this.m_objPacketHead.SessionId;
      }
      
      public function setPayload(... rest) : Boolean
      {
         var _loc2_:int = 0;
         if(rest.length == 2)
         {
            if(rest[0] is ByteArray && rest[1] is int)
            {
               if(!this.m_objPayloadBuffer.alloc(rest[1]))
               {
                  return false;
               }
               this.m_objPayloadBuffer.setByBuffer(rest[0]);
               this.m_objPayloadBuffer.setDataLength(rest[1]);
            }
         }
         else if(rest.length == 1)
         {
            if(rest[0] is Buffer)
            {
               _loc2_ = rest[0].getDataLength();
               this.m_objPayloadBuffer.alloc(_loc2_);
               this.m_objPayloadBuffer.setByBuffer(rest[0].getData());
               this.m_objPayloadBuffer.setDataLength(rest[0].getDataLength());
            }
         }
         else
         {
            return false;
         }
         return true;
      }
      
      public function getPayload() : Buffer
      {
         var _loc1_:Buffer = new Buffer();
         var _loc2_:int = this.m_objPayloadBuffer.getDataLength();
         var _loc3_:Boolean = _loc1_.alloc(_loc2_);
         if(!_loc3_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         _loc1_.setByBuffer(this.m_objPayloadBuffer.getData());
         return _loc1_;
      }
      
      public function getPacket(bufferParam:Buffer) : int
      {
         var dataLength:int = this.m_objPayloadBuffer.getDataLength();
         var sumDataLength:int = CommonConst.CONST_LENGTH_PACKET_HEAD + dataLength;
         
         var isAllocated:Boolean = bufferParam.alloc(sumDataLength);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         this.m_objPacketHead.PayloadLength = dataLength;
         var packetHeadBuffer:Buffer = this.m_objPacketHead.getPacketHead();
         
         isAllocated = bufferParam.append(packetHeadBuffer);
         if(!isAllocated)
         {
            return NetworkIOError.SN_ERROR_PACKET_HEAD_CREATE_ERROR;
         }
         
         isAllocated = bufferParam.append(this.m_objPayloadBuffer);
         if(!isAllocated)
         {
            return NetworkIOError.SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR;
         }
         
         bufferParam.getByBuffer().position = 0;
         return GeneralError.SN_SUCCESS;
      }
   }
}
