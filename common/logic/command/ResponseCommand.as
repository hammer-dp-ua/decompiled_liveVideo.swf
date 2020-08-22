package common.logic.command
{
   import common.logic.includes.CommandError;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class ResponseCommand extends Command
   {
       
      
      private var m_iCommandPayloadLength:int;
      
      private var m_objResponse:Response;
      
      public function ResponseCommand()
      {
         super();
         this.m_objResponse = new Response();
         setCommandId(CommandConst.CONST_COMMANDID_RESPONSE);
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeInt(1);
         _loc1_.position = 0;
         this.m_iCommandPayloadLength = 3 * _loc1_.length;
      }
      
      public function setResponse(param1:Response) : void
      {
         this.m_objResponse = param1;
      }
      
      public function getResponse() : Response
      {
         return this.m_objResponse;
      }
      
      public function getCommand(param1:Buffer) : void
      {
         var _loc2_:int = this.m_iCommandPayloadLength;
         var _loc3_:int = CommandHead.getLength() + _loc2_;
         var _loc4_:Boolean = param1.alloc(_loc3_);
         if(!_loc4_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         var _loc5_:Buffer = new Buffer();
         setPayloadLength(_loc2_);
         var _loc6_:int = getCommandHead(_loc5_);
         if(_loc6_ != GeneralError.SN_SUCCESS)
         {
            throw new Error(_loc6_);
         }
         _loc4_ = param1.append(_loc5_);
         if(!_loc4_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         _loc4_ = param1.append(this.m_objResponse.RequestId);
         if(!_loc4_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         _loc4_ = param1.append(this.m_objResponse.SucceedFlag);
         if(!_loc4_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         _loc4_ = param1.append(this.m_objResponse.ErrorNo);
         if(!_loc4_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
      }
      
      public function parseCommand(param1:Buffer) : int
      {
         var _loc2_:int = parseCommandHead(param1);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         if(getCommondId() != CommandConst.CONST_COMMANDID_RESPONSE)
         {
            return CommandError.SN_ERROR_COMMAND_UNKNOW;
         }
         if(param1.getDataLength() > CommonConst.CONST_MAXLENGTH_RESPONSEINFO)
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         if(getPayloadLength() != param1.getDataLength() - CommandHead.getLength())
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         if(getPayloadLength() < this.m_iCommandPayloadLength)
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         var _loc3_:ByteArray = param1.getData();
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc4_.writeInt(_loc3_.readInt());
         _loc4_.position = 0;
         _loc5_ = _loc5_ + _loc4_.length;
         this.m_objResponse.RequestId = _loc4_.readInt();
         _loc4_ = new ByteArray();
         _loc4_.writeInt(_loc3_.readInt());
         _loc4_.position = 0;
         _loc5_ = _loc5_ + _loc4_.length;
         this.m_objResponse.SucceedFlag = _loc4_.readInt();
         _loc4_ = new ByteArray();
         _loc4_.writeInt(_loc3_.readInt());
         _loc4_.position = 0;
         _loc5_ = _loc5_ + _loc4_.length;
         this.m_objResponse.ErrorNo = _loc4_.readInt();
         return GeneralError.SN_SUCCESS;
      }
   }
}
