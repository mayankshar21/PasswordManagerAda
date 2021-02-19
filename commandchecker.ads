with Ada.Text_IO; use Ada.Text_IO;with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Lock; use Lock;
with PasswordDatabase;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with MyStringTokeniser;
with PIN;
with CommandExecuter;

package CommandChecker is

   function CheckCommand(L : in out Lock.Lock;
                         DB: in out PasswordDatabase.Database;
                         FirstToken : in Unbounded_String;
                         SecondToken : in Unbounded_String;
                         ThirdToken : in Unbounded_String)
                         return Unbounded_String;

end CommandChecker;
