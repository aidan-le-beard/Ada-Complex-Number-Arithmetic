-- import packages
with ComplexNumbers; use ComplexNumbers; -- our defined package
with Ada.Text_IO; use Ada.Text_IO; -- for input/output
with Ada.Strings.Fixed; use Ada.Strings.Fixed; --normal Ada string like an array
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; -- for printing (Put()) an int

-- function declaration
procedure Cnmain is

   -- variables come before begin

   last : Integer;
   -- others fills the part of the string you didn't fill... here everything
   firstComp : String (1 .. 50) := (others => ' ');
   secondComp : String (1 .. 50) := (others => ' ');
   firstReal : Integer;
   secondReal : Integer;
   firstImaginary : Integer;
   secondImaginary : Integer;

-- execute the function
begin

   -- get input, stored in firstComp, to the end of the string length "last"
   Put("Enter a complex number in the form X+Xi: ");
   Get_Line(firstComp, last);

   -- get input, stored in secondComp, to the end of the string length "last"
   Put("Enter a second complex number in the form X+Xi: ");
   Get_Line(secondComp, last);

   -- parse the input strings for the real and imaginary numbers
   firstReal := getReal(firstComp);

   secondReal := getReal(secondComp);

   firstImaginary := getImaginary(firstComp);

   secondImaginary := getImaginary(secondComp);

   New_Line;
   Put_Line("Result of Complex Addition:");

   -- try a declaration-->begin-->end block where you can declare variables anywhere in the code
   -- for the result returned by complexAddition()
   declare
      returnAddition: String := complexAddition(firstReal, secondReal, firstImaginary, secondImaginary);
   begin
      Put_Line(returnAddition);
   end;

   New_Line;
   Put_Line("Result of Complex Subtraction:");

   -- print the result of the method directly
   Put_Line(complexSubtraction(firstReal, secondReal, firstImaginary, secondImaginary));   

   New_Line;
   Put_Line("Result of Complex Multiplication:");
   Put_Line(complexMultiplication(firstReal, secondReal, firstImaginary, secondImaginary));

   New_Line;
   Put_Line("Result of Complex Division:");
   Put_Line(complexDivision(firstReal, secondReal, firstImaginary, secondImaginary));

end Cnmain; -- end the function