package common.service.Communication
{
   public interface IErrorHandler
   {
       
      
      function process_ErrorHanlder() : int;
      
      function isInvokeFlag() : Boolean;
      
      function setInvokeFlag(param1:Boolean) : void;
      
      function pushInvokeObject(param1:Object) : void;
      
      function pushInvokeFunction(param1:Function) : void;
   }
}
