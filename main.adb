pragma SPARK_Mode (On);

with PasswordDatabase;
with MyCommandLine;
with MyString;
with MyStringTokeniser;
with PIN;
with Lock;
with CommandChecker;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
procedure Main is
   DB : PasswordDatabase.Database;

   package Lines is new MyString(Max_MyString_Length => 2048);
   S  : Lines.MyString;
   L  : Lock.Lock;
   T  : MyStringTokeniser.TokenArray(1..5) := (others => (Start => 1, Length => 0));
   NumTokens : Natural;
   FirstToken : Unbounded_String;
   SecondToken : Unbounded_String;
   ThirdToken : Unbounded_string;
begin

   if MyCommandLine.Argument_Count >= 1 then
      L := Lock.Init_Lock(PIN.From_String(MyCommandLine.Argument(1)));New_Line;

      Infinite_Loop:
      loop
         if Lock.isLocked(L) then
            Put("locked> ");
         else
            Put("unlocked> ");
         end if;

         Lines.Get_Line(S);
         MyStringTokeniser.Tokenise(Lines.To_String(S),T,NumTokens);

         --move below inside chcker ???
         if NumTokens > 3 then
            Put_Line("Too many tokens!");
         else
            for I in 1..NumTokens loop
               declare
                  TokStr : String := Lines.To_String(Lines.Substring(S,T(I).Start,T(I).Start+T(I).Length-1));
               begin
                  if I = 1 then
                     FirstToken := To_Unbounded_String(TokStr);
                  elsif I = 2 then
                     SecondToken := To_Unbounded_String(TokStr);
                  elsif I = 3 then
                     ThirdToken := To_Unbounded_String(TokStr);
                  end if;
               end;
            end loop;
            Put(To_String(CommandChecker.CheckCommand(L, DB, FirstToken,
                SecondToken, ThirdToken))); New_Line;
         end if;
         FirstToken := To_Unbounded_String("");
         SecondToken := To_Unbounded_String("");
         ThirdToken := To_Unbounded_String("");
      end loop Infinite_Loop;

   else
       Put("Did not set a masterpin when called.. exiting Passbook");
   end if;

end Main;
