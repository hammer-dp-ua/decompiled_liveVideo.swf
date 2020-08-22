package common.logic.command.AVStream
{
   import common.logic.command.Command;
   import common.logic.command.CommandConst;
   import common.logic.command.CommandHead;
   import common.logic.includes.GeneralError;
   import common.service.Communication.Buffer;
   
   public class ChangeAVStreamCommand extends Command
   {
       
      
      private var m_iCameraId:int;
      
      private var m_iStreamId:int;
      
      private var m_iConsumerId:int;
      
      public function ChangeAVStreamCommand()
      {
         super();
         this.setCommandId(CommandConst.CONST_COMMANDID_CHANGE_AV_STREAM);
         this.m_iCameraId = 0;
         this.m_iStreamId = 0;
         this.m_iConsumerId = 0;
      }
      
      public function set CameraId(param1:int) : void
      {
         this.m_iCameraId = param1;
      }
      
      public function get CameraId() : int
      {
         return this.m_iCameraId;
      }
      
      public function set StreamId(param1:int) : void
      {
         this.m_iStreamId = param1;
      }
      
      public function get StreamId() : int
      {
         return this.m_iStreamId;
      }
      
      public function set ConsumerId(param1:int) : void
      {
         this.m_iConsumerId = param1;
      }
      
      public function get ConsumerId() : int
      {
         return this.m_iConsumerId;
      }
      
      public function getCommand(param1:Buffer) : int
      {
         var _loc2_:String = new String("");
         _loc2_ = _loc2_ + ("<ChangeAVStreamCommand CameraId=\"" + this.m_iCameraId + "\" StreamId=\"" + this.m_iStreamId + "\" ComsumerId=\"" + this.m_iConsumerId + "\" />");
         var _loc3_:int = _loc2_.length + 1;
         var _loc4_:int = CommandHead.getLength() + _loc3_;
         var _loc5_:Boolean = param1.alloc(_loc4_);
         if(!_loc5_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         super.setPayloadLength(_loc3_);
         var _loc6_:Buffer = new Buffer();
         var _loc7_:int = super.getCommandHead(_loc6_);
         if(_loc7_ != GeneralError.SN_SUCCESS)
         {
            return _loc7_;
         }
         _loc5_ = param1.append(_loc6_);
         if(!_loc5_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         _loc5_ = param1.append(_loc2_,_loc3_);
         if(!_loc5_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         return GeneralError.SN_SUCCESS;
      }
   }
}
