package ComplexNumbers is

   -- FUNCTION returns a value, PROCEDURE doesn't

   -- THE RETURNS AND PARAMETERS HERE HAVE TO MATCH THE PACKAGE FILE
   function getReal (firstComp: String) return Integer;
   function getImaginary (firstComp: String) return Integer;
   function complexAddition (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String;
   function complexSubtraction (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String;
   function complexMultiplication (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String;
   function complexDivision (firstReal, secondReal, firstImaginary, secondImaginary: Integer) return String;   

end ComplexNumbers;