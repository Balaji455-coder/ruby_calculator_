class Calculator 
    def calculate(expression)
        res = 0
        sign = 1
        num = 0
        stack = []
        op_stack = []
        expression.each_char.with_index do |ch, idx|
            puts "res #{res} num #{num} sign #{sign} stack #{stack} ch #{ch}"
            case ch
            when /\d/
                num = num*10 + ch.to_i
            when '+', '-'
                if !op_stack.empty? && (op_stack.last == "*" || op_stack.last == "/")
                    num = process_data(op_stack.pop, stack.pop, num)
                end
                res += num*sign 
                sign = ch == "+" ? 1 : -1
                num = 0
            when '*', '/'
                if !op_stack.empty? && (op_stack.last == "*" || op_stack.last == "/")
                    num = process_data(op_stack.pop, stack.pop, num)
                end
                stack.push(num)
                op_stack.push(ch)
                num = 0
            when "("
                stack.push(res)
                stack.push(sign)
                res = 0
                sign = 1
            when ")"
                if !op_stack.empty? && (op_stack.last == "*" || op_stack.last == "/")
                    num = process_data(op_stack.pop, stack.pop, num)
                end
                res += num*sign 
                res *= stack.pop
                res += stack.pop
                num = 0
            else
            end
        end
        if !op_stack.empty? && (op_stack.last == "*" || op_stack.last == "/")
            num = process_data(op_stack.pop, stack.pop, num)
        end
        res += num*sign
        return res
    end

    def complex_calculate(expression)
        res = 0
        sign = 1
        num = 0
        stack = []
        i = 0
        
        while i < expression.length do 
          ch = expression[i]
          puts "res #{res} num #{num} sign #{sign} stack #{stack} ch #{ch}"
          
          case ch
          when /\d/  # If the character is a digit
            num = num * 10 + ch.to_i
    
          when '+', '-'  # If the character is + or -
            res += num * sign
            sign = (ch == "+") ? 1 : -1
            num = 0
    
          when '*' , '/'  # If the character is * or /
            i += 1
            while i < expression.length && expression[i] == " "
              i += 1
            end
            next_num = 0
            while i < expression.length && expression[i] =~ /\d/
              next_num = next_num * 10 + expression[i].to_i
              i += 1
            end
            # Perform multiplication or division immediately with the next number
            num = (ch == "*") ? (num * next_num) : (num / next_num)
            i -= 1  # Adjust index because it would have gone one character ahead in the inner while loop
    
          when "("  # If the character is an opening parenthesis
            stack.push(res)
            stack.push(sign)
            res = 0
            sign = 1
    
          when ")"  # If the character is a closing parenthesis
            res += num * sign
            num = 0
            res *= stack.pop
            res += stack.pop
    
          else
            # Handle unexpected characters (optional)
          end
          i += 1
        end
    
        # Add the final number to the result
        res += num * sign
        return res
    end

    def process_data(op, num1, num2)
        case op 
        when '*'
            num = num1 * num2
        when '/'
            num = num1 / num2
        end
        num 
    end

    def gpt(expression)
        res = 0
        sign = 1
        num = 0
        stack = []
        
        for i in 0...expression.length
          ch = expression[i]
    
          case ch
          when /\d/
            num = num * 10 + ch.to_i
          when '+', '-'
            res += num * sign
            sign = ch == '+' ? 1 : -1
            num = 0
          when '*', '/'
            i += 1
            while i < expression.length && expression[i] == ' '
              i += 1
            end
            next_num = 0
            while i < expression.length && expression[i] =~ /\d/
              next_num = next_num * 10 + expression[i].to_i
              i += 1
            end
            num = ch == '*' ? num * next_num : num / next_num
            i -= 1
          when '('
            stack.push(res)
            stack.push(sign)
            res = 0
            sign = 1
          when ')'
            res += num * sign
            num = res
            sign = stack.pop
            res = stack.pop
          end
        end
    
        res += num * sign
        res
      end
end






  


cal = Calculator.new
res =  cal.complex_calculate('2+(3-(1+4)*10)')
puts "response #{res}"