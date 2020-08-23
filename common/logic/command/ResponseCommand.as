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
      
      public function parseCommand(responseBuffer:Buffer) : int
      {
         var parseCommandHeadStatus:int = parseCommandHead(responseBuffer);
         if(parseCommandHeadStatus != GeneralError.SN_SUCCESS)
         {
            return parseCommandHeadStatus;
         }
         
         if(getCommondId() != CommandConst.CONST_COMMANDID_RESPONSE)
         {
            return CommandError.SN_ERROR_COMMAND_UNKNOW;
         }
         if(responseBuffer.getDataLength() > CommonConst.CONST_MAXLENGTH_RESPONSEINFO)
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         if(getPayloadLength() != responseBuffer.getDataLength() - CommandHead.getLength())
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         if(getPayloadLength() < this.m_iCommandPayloadLength)
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         
         var responseData:ByteArray = responseBuffer.getData();
         var readResult:ByteArray = new ByteArray();
         var sumBytes:int = 0;
         var _loc6_:int = 0;
         
         readResult.writeInt(responseData.readInt());
         readResult.position = 0;
         sumBytes += readResult.length;
         this.m_objResponse.RequestId = readResult.readInt();
         
         readResult = new ByteArray();
         readResult.writeInt(responseData.readInt());
         readResult.position = 0;
         sumBytes += readResult.length;
         this.m_objResponse.SucceedFlag = readResult.readInt();
         
         readResult = new ByteArray();
         readResult.writeInt(responseData.readInt());
         readResult.position = 0;
         sumBytes += readResult.length;
         this.m_objResponse.ErrorNo = readResult.readInt();
         
         return GeneralError.SN_SUCCESS;
      }
   }
}
