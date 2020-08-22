package common.logic.includes
{
   public class CommandError
   {
      
      public static const SN_ERROR_COMMAND_BEGIN:int = -400;
      
      public static const SN_ERROR_COMMAND_UNKNOW:int = SN_ERROR_COMMAND_BEGIN - 1;
      
      public static const SN_ERROR_COMMAND_HEAD_PARSE_ERROR:int = SN_ERROR_COMMAND_BEGIN - 2;
      
      public static const SN_ERROR_COMMAND_HEAD_CREATE_ERROR:int = SN_ERROR_COMMAND_BEGIN - 3;
      
      public static const SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR:int = SN_ERROR_COMMAND_BEGIN - 4;
      
      public static const SN_ERROR_COMMAND_PAYLOAD_CREATE_ERROR:int = SN_ERROR_COMMAND_BEGIN - 5;
      
      public static const SN_ERROR_COMMAND_VERSION_ERROR:int = SN_ERROR_COMMAND_BEGIN - 6;
       
      
      public function CommandError()
      {
         super();
      }
   }
}
