def fix(input)
  output = []
  i = 0
  while i < (input.length - 1)
    # puts input[i]
    if !instructions?(input[i])
      output << input[i]
      i += 1
    elsif instructions?(input[i+1]) &&
      instructions?(input[i])
      output << input[i]
      i += 1
    elsif
      if instructions?(output[-1]) || output[-1].nil?
        output << ((input[i][0] * input[i][1]) + (input[i+1] - input[i][0]))
      else
        output[-1] += ((input[i][0] * input[i][1]) + (input[i+1] - input[i][0]))
      end
      i += 2
    end
  end
  # p output
  # puts "yo"
  output


end

def instructions?(input)
  input.is_a? Array
end

def decrypt
  input = File.open('d9_input.txt').read.split("")
  i = 0
  parsed_input = []
  while i < input.length
    if input[i] == "("
      instructions = "("
      until input[i] == ")"
        i += 1
        instructions << input[i]
      end
      instructions = instructions[1..-2].split("x").map{|el| el.to_i}
      parsed_input << instructions
      i += 1
    else
      if input[i-1] == ")"
        parsed_input << 1
      else
        parsed_input[-1] += 1
      end
      i += 1
    end
  end


  until parsed_input.length == 1
    p parsed_input
    parsed_input = fix(parsed_input)
  end
  parsed_input.first

end





p decrypt
