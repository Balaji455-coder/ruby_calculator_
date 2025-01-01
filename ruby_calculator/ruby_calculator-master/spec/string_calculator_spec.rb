require './calculator/string_calculator'

RSpec.describe StringCalculator, "add" do 

    before do 
        @sc = StringCalculator.new 
    end

    it "Empty string should return 0" do 
        res = @sc.add("")
        expect(res).to eq 0
    end 

    it "Return valid sum" do 
        res = @sc.add("2,3")
        expect(res).to eq 5
    end

    it "Return error when pass -ve numbers" do 
        res = @sc.add("-2,-3")
        expect(res).to eq "Negative numbers are not allowed, -2,-3"
    end

    it "Handle new line character in the string" do 
        res = @sc.add("\n2\n3,4")
        expect(res).to eq 9
    end

    it "Pass different delimiter" do 
        res = @sc.add("//;\n2;3;4")
        expect(res).to eq 9
    end

    it "Pass different delimiter with new line" do 
        res = @sc.add("//;\n2\n3;4")
        expect(res).to eq 9
    end
end 

[1, 2, 3, 10] 
smallest_sum = 1


nums.each do |num|
    return smallest_sum if smallest_sum < num
    smallest_sum += num
end
return