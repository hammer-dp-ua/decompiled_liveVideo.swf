package common.logic.includes
{
   public class GeneralError
   {
      
      public static const SN_SUCCESS:int = 0;
      
      public static const SN_ERROR_GENERAL_BEGIN:int = 0;
      
      public static const SN_ERROR_NOT_ENOUGH_MEMORY:int = SN_ERROR_GENERAL_BEGIN - 2;
      
      public static const SN_ERROR_NULL_POINTER:int = SN_ERROR_GENERAL_BEGIN - 4;
      
      public static const SN_ERROR_INVALID_FUNCTION:int = SN_ERROR_GENERAL_BEGIN - 5;
      
      public static const SN_ERROR_BAD_ENVIRONMENT:int = SN_ERROR_GENERAL_BEGIN - 6;
      
      public static const SN_ERROR_BAD_PARAMETER:int = SN_ERROR_GENERAL_BEGIN - 8;
      
      public static const SN_ERROR_THREAD_RUNING:int = SN_ERROR_GENERAL_BEGIN - 11;
      
      public static const SN_ERROR_THREAD_START_FAILED:int = SN_ERROR_GENERAL_BEGIN - 12;
      
      public static const SN_ERROR_QUEUE_FULL:int = SN_ERROR_GENERAL_BEGIN - 13;
      
      public static const SN_ERROR_QUEUE_EMPTY:int = SN_ERROR_GENERAL_BEGIN - 14;
      
      public static const SN_ERROR_SYSTEM_TIMEOUT:int = SN_ERROR_GENERAL_BEGIN - 15;
       
      
      public function GeneralError()
      {
         super();
      }
   }
}
