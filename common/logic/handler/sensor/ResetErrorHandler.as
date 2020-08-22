package common.logic.handler.sensor
{
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.IErrorHandler;
   import common.service.Communication.TCPTransfer;
   
   public class ResetErrorHandler implements IErrorHandler
   {
       
      
      private var m_objTCPTransfer:TCPTransfer;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      private var m_objObjectList:Vector.<Object>;
      
      public function ResetErrorHandler(param1:TCPTransfer)
      {
         super();
         this.m_objFunctionList = new Vector.<Function>();
         this.m_objObjectList = new Vector.<Object>();
         this.m_objTCPTransfer = param1;
      }
      
      public function process_ErrorHanlder() : int
      {
         var _loc1_:ICommandHandler = null;
         var _loc2_:int = 0;
         var _loc3_:Function = null;
         if(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
         {
            _loc1_ = this.m_objTCPTransfer.popCommandHandler();
            this.m_objTCPTransfer.pushErrorRealCommandHandler(this);
            _loc2_ = _loc1_.sendCommand();
            if(_loc2_ == 0)
            {
               this.m_objTCPTransfer.pushCommandHandler(_loc1_);
            }
            return _loc2_;
         }
         if(this.isInvokeFlag())
         {
            while(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
            {
               this.m_objTCPTransfer.popCommandHandler();
            }
            while(this.m_objTCPTransfer.getErrorHandlerListLength() > 0)
            {
               this.m_objTCPTransfer.popErrorRealCommandHandler();
            }
            _loc3_ = this.m_objFunctionList.pop();
            _loc3_.call(null,this.m_objTCPTransfer.ErrorCode);
         }
         return 0;
      }
      
      public function setInvokeFlag(param1:Boolean) : void
      {
         this.m_bInvokeFlag = param1;
      }
      
      public function isInvokeFlag() : Boolean
      {
         return this.m_bInvokeFlag;
      }
      
      public function pushInvokeObject(param1:Object) : void
      {
         this.m_objObjectList.push(param1);
      }
      
      public function pushInvokeFunction(param1:Function) : void
      {
         this.m_objFunctionList.push(param1);
      }
   }
}
