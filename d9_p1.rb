def decrypt(message)
  output = ""
  i = 0
  while i < message.length
    if i < message.length - 1 && instructions?(message[i+1])
      i += 1
      next
    elsif i < message.length - 1 && instructions?(message[i])
      message[i][1].times do
        output << message[i+1][0...message[i][0]]
      end
      output << message[i+1][message[i][0]..-1]
      i += 2
    else
      output << message[i]
      i += 1
    end
  end
  output
end

def instructions?(message)
  message.length == 2
end

def parse_input
  input = File.open('d9_input.txt').read
  input = input.split("(")
  input = input.map do |el|
            el.split(")")
          end.flatten
  input = input.map do |el|
            if el[0].to_i != 0
              el.split("x").map{|num| num.to_i}
            else
              el
            end
          end
  input
end

def run
  message = parse_input
  decrypted_message = decrypt(message)
  decrypted_message.length
end


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
