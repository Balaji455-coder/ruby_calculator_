# # calculator_spec.rb
# require './calculator'

# RSpec.describe Calculator, "#add" do
#   it "adds two numbers correctly" do
#     calculator = Calculator.new
#     result = calculator.add(2, 3)
#     expect(result).to eq(5)
#   end
# end

require './calculator/calculator'

RSpec.describe Calculator, "add" do 

  before do 
    @cal = Calculator.new
  end

  it "it should return usual sum" do 
    res = @cal.calculate("2+3")
    expect(res).to eq 5
  end

  it "consider brackets" do 
    res = @cal.calculate("2-(2+3)")
    expect(res).to eq -3
  end

  it "consider complex expression" do 
    res = @cal.calculate("2+(3-(1+4)+10)")
    expect(res).to eq 10
  end

  it "expression contains whitespaces" do
    res = @cal.calculate(" 2 + (3 - 1) ")
    expect(res).to eq 4
  end

  it "expression contains -ve values" do
    res = @cal.calculate(" -2 - (-3 - 1) ")
    expect(res).to eq 2
  end
end