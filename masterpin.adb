with PIN;

package body MasterPin with SPARK_Mode is

   procedure Set_Pin(I : in out Integer) is
   begin
      MasterPin.MasterPin := P;
   end Set_Pin;

   function Get_Pin return MasterPin is
   begin
      return MasterPin;
   end Get_Pin;

end MasterPin;
