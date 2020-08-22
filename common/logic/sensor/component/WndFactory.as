package common.logic.sensor.component
{
   import common.logic.sensor.consts.Wnd_Type;
   
   public class WndFactory
   {
       
      
      public function WndFactory()
      {
         super();
      }
      
      public static function create(param1:String) : Wnd
      {
         if(param1 == Wnd_Type.Slider)
         {
            return new SliderWnd();
         }
         if(param1 == Wnd_Type.Combobox)
         {
            return new ComboBoxWnd();
         }
         if(param1 == Wnd_Type.Group)
         {
            return new GroupWnd();
         }
         if(param1 == Wnd_Type.ComboItem)
         {
            return new ComboBoxItemWnd();
         }
         if(param1 == Wnd_Type.Checkbox)
         {
            return new CheckBoxWnd();
         }
         if(param1 == Wnd_Type.RadioButton)
         {
            return new RadioButtonWnd();
         }
         if(param1 == Wnd_Type.RadioGroup)
         {
            return new RadioButtonGroupWnd();
         }
         if(param1 == Wnd_Type.ActionButton)
         {
            return new ActionButtonWnd();
         }
         throw Error("unknow type");
      }
   }
}
