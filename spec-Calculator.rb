class Calculator

    def addition (a, b)
        a + b
    end

    def factorial (n)
       if n == 0
        1
       else
       (1..n).reduce(:*)
       end
    end

end



RSpec.describe Calculator do

  describe "#addition" do

    it "Will return the sum of the arguments" do
        calc = Calculator.new

        expect(calc.addition(1,2)).to eq(3)
    end

    it "Returns the sum of two different numbers" do
       calc = Calculator.new

       expect(calc.addition(15,5)).to eq(20)
    
    end
  end

  describe "#factorial" do
  
    it "Will return 1 when given the integer 0" do
        calc = Calculator.new

        expect(calc.factorial(0)).to eq(1)
    end

    it "Will return of the sum of all the positive numbers before the argumnet multiplied togther" do
        calc = Calculator.new

        expect(calc.factorial(5)).to eq(120)
    end

  end

end  
  