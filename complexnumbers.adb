with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body ComplexNumbers is

   -- FUNCTION returns a value, PROCEDURE doesn't
   function getReal (firstComp: String) return Integer is
      firstReal : Integer := 0;
      begin
         -- parse the string to an imaginary number: find the real number if it exists
         -- '=' is equivalent to '==', while ':=' is equivalent to '='
         -- if there's no imaginary number, then just a real number is given
         if Ada.Strings.Fixed.Count(firstComp, "i") = 0 then
            firstReal := Integer'Value(firstComp);
         -- else if there's a "+" (imaginary and a real number given)
         elsif Ada.Strings.Fixed.Count(firstComp, "+") /= 0 then
            firstReal := Integer'Value(firstComp(1 .. Ada.Strings.Fixed.index(firstComp, "+") - 1));
         end if;
         return firstReal;
      end getReal;

   function getImaginary (firstComp: String) return Integer is
      firstImaginary : Integer := 0;
      begin
	   -- if a given imaginary number and a real number...
         if Ada.Strings.Fixed.Count(firstComp, "i") /= 0 and Ada.Strings.Fixed.Count(firstComp, "+") /= 0 then
            firstImaginary := Integer'Value(firstComp(Ada.Strings.Fixed.index(firstComp, "+") + 1 .. Ada.Strings.Fixed.index(firstComp, "i") - 1));
         -- else if there's only an imaginary number
         elsif Ada.Strings.Fixed.Count(firstComp, "i") /= 0 then
            firstImaginary := Integer'Value(firstComp(1 .. Ada.Strings.Fixed.index(firstComp, "i") - 1));
         end if;
         return firstImaginary;
      end getImaginary;

   function complexAddition (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String is
      addedReals : Integer := firstReal + secondReal;
      addedImaginaries : Integer := firstImaginary + secondImaginary;
      printableReals : String := Integer'Image(addedReals);
      printableImaginaries : String := Integer'Image(addedImaginaries);
      begin
         return (printableReals & "+" & printableImaginaries & "i");
      end complexAddition;

   function complexSubtraction (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String is
      subtractedReals : Integer := firstReal - secondReal;
      subtractedImaginaries : Integer := firstImaginary - secondImaginary;
      printableReals : String := Integer'Image(subtractedReals);
      printableImaginaries : String := Integer'Image(subtractedImaginaries);
      begin
         return (printableReals & "+" & printableImaginaries & "i");
      end complexSubtraction;

   function complexMultiplication (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String is
      multipliedReals : Integer := firstReal * secondReal;
      multipliedImaginaries : Integer := firstImaginary * secondImaginary;
      begin
         if multipliedImaginaries /= 0 then
            multipliedReals := multipliedReals - multipliedImaginaries;
            multipliedImaginaries := 0;
         end if;
         multipliedImaginaries := firstImaginary * secondReal;
         multipliedImaginaries := multipliedImaginaries + (firstReal * secondImaginary);
         
         declare
            printableReals : String := Integer'Image(multipliedReals);
            printableImaginaries : String := Integer'Image(multipliedImaginaries);
         begin
            return (printableReals & "+" & printableImaginaries & "i");
         end;
      end complexMultiplication;

   function complexDivision (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String is
      numerator : String := complexMultiplication(firstReal, secondReal, firstImaginary, secondImaginary * (-1));
      denominator : String := complexMultiplication(secondReal, secondReal, secondImaginary, secondImaginary * (-1));
      begin
         return ("(" & numerator & ")" & " / " & "(" & denominator & ")");
      end complexDivision;
     
end ComplexNumbers;