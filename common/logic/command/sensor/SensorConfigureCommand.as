package common.logic.command.sensor
{
   import common.logic.command.Command;
   import common.logic.command.CommandConst;
   import common.logic.command.CommandHead;
   import common.logic.includes.CommandError;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class SensorConfigureCommand extends Command
   {
      
      public static const GET_UI_INIT_CONFIG_REQUEST:int = 1;
      
      public static const GET_UI_INIT_CONFIG_RESPONSE:int = 2;
      
      public static const SET_PARAMETES_REQUEST:int = 3;
      
      public static const GET_ALL_PARAMETES_REQUEST:int = 4;
      
      public static const GET_PARAMETES_REQUEST:int = 5;
      
      public static const GET_PARAMETES_RESPONSE:int = 6;
      
      public static const RESET_PARAMETES_REQUEST:int = 7;
      
      public static const SAVE_PARAMETES_REQUEST:int = 8;
      
      public static const SET_SECRET_AREA_REQUEST:int = 9;
      
      public static const GET_SENSOR_TYPE_REQUEST:int = 10;
      
      public static const GET_SENSOR_TYPE_RESPONSE:int = 11;
      
      public static const GET_SENSOR_STATUS_REQUEST:int = 12;
      
      public static const GET_SENSOR_STATUS_RESPONSE:int = 13;
      
      public static const GET_UI_INIT_CONFIG_REQUEST_V2:int = 14;
      
      public static const GET_UI_STYLE_CONFIG_REQUEST:int = 15;
      
      public static const GET_UI_COMMON_CONFIG_REQUEST:int = 16;
      
      public static const GET_UI_LANGUAGE_CONFIG_REQUEST:int = 17;
      
      public static const RESET_TO_LAST_PARAMETERS_REQUEST:int = 18;
       
      
      private var m_iSubCommandId:int;
      
      private var m_iResultCode:int;
      
      private var m_strSubCommandBody:String;
      
      public function SensorConfigureCommand()
      {
         super();
         this.m_strSubCommandBody = "";
         this.setCommandId(CommandConst.CONST_COMMANDID_SENSE_CONFIGURE);
      }
      
      public function set SubCommandId(param1:int) : void
      {
         this.m_iSubCommandId = param1;
      }
      
      public function get SubCommandId() : int
      {
         return this.m_iSubCommandId;
      }
      
      public function set SubCommandBody(param1:String) : void
      {
         this.m_strSubCommandBody = param1;
      }
      
      public function get SubCommandBody() : String
      {
         return this.m_strSubCommandBody;
      }
      
      public function set ResultCode(param1:int) : void
      {
         this.m_iResultCode = param1;
      }
      
      public function get ResultCode() : int
      {
         return this.m_iResultCode;
      }
      
      public function getCommand(bufferParam:Buffer) : int
      {
         var _loc2_:Buffer = new Buffer();
         var byteArray:ByteArray = new ByteArray();
         byteArray.writeInt(this.m_iSubCommandId);
         byteArray.position = 0;
         var sumLength1:int = byteArray.length * 3 + this.m_strSubCommandBody.length;
         var sumLength2:int = CommandHead.getLength() + sumLength1;
         var isAllocated:Boolean = bufferParam.alloc(sumLength2);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         var commandHeadBuffer:Buffer = new Buffer();
         var getCommandHeadStatus:int = super.getCommandHead(commandHeadBuffer);
         if(getCommandHeadStatus != GeneralError.SN_SUCCESS)
         {
            return getCommandHeadStatus;
         }
         
         isAllocated = bufferParam.append(commandHeadBuffer);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_iSubCommandId);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_iResultCode);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(this.m_strSubCommandBody.length);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         byteArray = new ByteArray();
         byteArray.writeMultiByte(this.m_strSubCommandBody,CommonConst.SOCKET_DATA_ENCODE_GB);
         byteArray.position = 0;
         
         isAllocated = bufferParam.append(byteArray);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function parseCommand(bufferParam:Buffer) : int
      {
         var parseCommandHeadStatus:int = parseCommandHead(bufferParam);
         if(parseCommandHeadStatus != GeneralError.SN_SUCCESS)
         {
            return parseCommandHeadStatus;
         }
         
         if(super.getCommondId() != CommandConst.CONST_COMMANDID_SENSE_CONFIGURE)
         {
            return CommandError.SN_ERROR_COMMAND_UNKNOW;
         }
         
         var bufferParamData:ByteArray = bufferParam.getData();
         var sum:int = 0;
         this.m_iSubCommandId = bufferParamData.readInt();
         sum += (bufferParamData.length - bufferParamData.bytesAvailable);
         this.m_iResultCode = bufferParamData.readInt();
         sum += (bufferParamData.length - sum - bufferParamData.bytesAvailable);
         var _loc5_:int = bufferParamData.readInt();
         sum += (bufferParamData.length - sum - bufferParamData.bytesAvailable);
         this.m_strSubCommandBody = bufferParamData.readMultiByte(_loc5_, CommonConst.SOCKET_DATA_ENCODE_UTF);
         return GeneralError.SN_SUCCESS;
      }
   }
}
