package common.logic.command.ptz
{
   import common.logic.command.Command;
   import common.logic.command.CommandConst;
   import common.logic.command.CommandHead;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class PTZOperationCommand extends Command
   {
       
      
      private var m_iCameraId:int;
      
      private var m_sPTZOperation:String;
      
      public function PTZOperationCommand()
      {
         this.m_iCameraId = 0;
         this.m_sPTZOperation = "";
         super();
         super.setCommandId(CommandConst.CONST_COMMANDID_PTZ_OPERATION);
      }
      
      public function set CameraId(param1:int) : void
      {
         this.m_iCameraId = param1;
      }
      
      public function get CameraId() : int
      {
         return this.m_iCameraId;
      }
      
      public function set PTZOperation(param1:String) : void
      {
         this.m_sPTZOperation = param1;
      }
      
      public function get PTZOperation() : String
      {
         return this.m_sPTZOperation;
      }
      
      public function getCommand(param1:Buffer) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(this.m_iCameraId);
         _loc2_ = _loc3_.length;
         _loc3_.writeMultiByte(this.m_sPTZOperation,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         _loc2_ = _loc2_ + _loc3_.length;
         var _loc4_:int = CommandHead.getLength() + _loc2_;
         var _loc5_:Boolean = param1.alloc(_loc4_);
         if(!_loc5_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         var _loc6_:Buffer = new Buffer();
         var _loc7_:int = super.getCommandHead(_loc6_);
         if(_loc7_ != GeneralError.SN_SUCCESS)
         {
            throw new Error(_loc7_);
         }
         _loc5_ = param1.append(_loc6_);
         if(!_loc5_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         _loc5_ = param1.append(this.m_iCameraId);
         if(!_loc5_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         _loc5_ = param1.append(this.m_sPTZOperation.length);
         if(!_loc5_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         _loc5_ = param1.append(this.m_sPTZOperation,this.m_sPTZOperation.length);
         if(!_loc5_)
         {
            throw new Error(GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY);
         }
         param1.getByBuffer().position = 0;
      }
   }
}
