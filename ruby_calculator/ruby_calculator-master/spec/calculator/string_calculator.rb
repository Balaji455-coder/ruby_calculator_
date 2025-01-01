class StringCalculator
    def add(str)
        sum = 0
        return sum if str.empty? 
        delimit = ","
        if str.start_with?"//"
            delimit = str[2]
            str = str[4..-1]
            puts "***********str******#{str}"
        end
        
        str = str.gsub("\n",delimit)
        puts "strinf after gsub #{str}" 

        str = str.split(delimit)
        puts "strinf after delimit #{str}" 

        arr = str.map{|a| a.to_i if a.to_i < 0}.compact
        return "Negative numbers are not allowed, #{arr.join(",")}" unless arr.empty?
        arr = str.map{|a| a.to_i if a.to_i}.compact
        return arr.sum 
    end
end