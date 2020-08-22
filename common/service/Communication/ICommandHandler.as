package common.service.Communication
{
   public interface ICommandHandler
   {
       
      
      function sendCommand(param1:int = 0) : int;
      
      function handleCommand(param1:Buffer) : int;
      
      function isReceiveFlag() : Boolean;
      
      function setReceiveFlag(param1:Boolean) : void;
      
      function isInvokeFlag() : Boolean;
      
      function setInvokeFlag(param1:Boolean) : void;
      
      function pushInvokeObject(param1:Object) : void;
      
      function pushInvokeFunction(param1:Function) : void;
      
      function setTCPTransfer(param1:TCPTransfer) : void;
   }
}
