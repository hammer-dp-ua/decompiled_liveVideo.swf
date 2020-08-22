package common.service.Communication
{
   import common.logic.share.CommonConst;
   import flash.utils.ByteArray;
   
   public class Buffer
   {
       
      
      private var m_byBuffer:ByteArray;
      
      private var m_byCurrentData:ByteArray;
      
      public var m_iBufferSize:uint;
      
      public var m_iDataLen:uint;
      
      private var m_iDataPos:uint;
      
      public function Buffer()
      {
         super();
         this.m_byBuffer = null;
         this.m_byCurrentData = null;
         this.m_iBufferSize = 0;
         this.m_iDataLen = 0;
         this.m_iDataPos = 0;
      }
      
      public function alloc(param1:uint) : Boolean
      {
         if(param1 <= 0)
         {
            return false;
         }
         if(this.m_byBuffer != null)
         {
            if(param1 == this.m_iBufferSize)
            {
               this.m_byBuffer.clear();
               this.m_byCurrentData = this.m_byBuffer;
               this.m_iDataLen = 0;
               return true;
            }
            this.m_byBuffer = null;
            this.m_byCurrentData = null;
            this.m_iDataLen = 0;
         }
         this.m_byBuffer = new ByteArray();
         if(this.m_byBuffer == null)
         {
            return false;
         }
         this.m_byCurrentData = this.m_byBuffer;
         this.m_iBufferSize = param1;
         return true;
      }
      
      public function append(... rest) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         if(rest.length == 1)
         {
            if(rest[0] is int)
            {
               _loc2_.writeInt(rest[0]);
               _loc2_.position = 0;
               return this.append(_loc2_);
            }
            if(rest[0] is Buffer)
            {
               return this.append(rest[0].getData());
            }
            if(rest[0] is ByteArray)
            {
               _loc3_ = rest[0].length;
               if(rest[0] == null || this.m_byBuffer == null)
               {
                  return false;
               }
               if(_loc3_ > this.m_iBufferSize - this.m_iDataLen)
               {
                  return false;
               }
               this.m_byBuffer.writeBytes(rest[0],0,rest[0].length);
               this.m_iDataLen = this.m_iDataLen + _loc3_;
               return true;
            }
         }
         else if(rest.length == 2)
         {
            if((rest[0] is String || rest[0] == null) && rest[1] is int)
            {
               _loc2_.length = rest[1];
               _loc2_.writeMultiByte(rest[0],CommonConst.SOCKET_DATA_ENCODE_GB);
               _loc2_.position = 0;
               return this.append(_loc2_);
            }
         }
         return false;
      }
      
      public function getData() : ByteArray
      {
         return this.m_byCurrentData = this.m_byBuffer;
      }
      
      public function getDataLength() : uint
      {
         return this.m_iDataLen;
      }
      
      public function getBufferSize() : int
      {
         return this.m_iBufferSize;
      }
      
      public function getBuffer() : ByteArray
      {
         return this.m_byCurrentData;
      }
      
      public function setDataLength(param1:uint) : void
      {
         if(param1 > this.m_iBufferSize)
         {
            this.m_iDataLen = this.m_iBufferSize;
         }
         else
         {
            this.m_iDataLen = param1;
         }
      }
      
      public function setByBuffer(param1:ByteArray) : void
      {
         this.m_byBuffer = param1;
      }
      
      public function getByBuffer() : ByteArray
      {
         return this.m_byBuffer;
      }
   }
}
