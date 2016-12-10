def decrypt2
  input = File.open('d9_input.txt').read.split("")
  i = 0
  output = ""
  while i < input.length
    if input[i] == "("
      instructions = "("
      until input[i] == ")"
        i += 1
        instructions << input[i]
      end
      instructions = instructions[1..-2].split("x").map{|el| el.to_i}
      instructions[1].times do
        output << input[(i+1)..(i+instructions[0])].join("")
      end
      i += instructions[0] + 1
    else
      output << input[i]
      i += 1
    end
  end
  p output
  output.chomp.length
end

p decrypt2
