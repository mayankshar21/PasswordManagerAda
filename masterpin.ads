with PIN;

package MasterPin with SPARK_Mode is

   type MasterPin is private;

   procedure Set_Pin(I : in out Integer);

   function Get_Pin return MasterPin;

private
   type MasterPin is record
      MasterPin : Integer;
   end record;

end MasterPin;
