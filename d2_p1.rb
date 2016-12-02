input = []
File.open('d2_p1_input.txt').each do |line|
  input << line.chomp
end

def fix_coords(coords)
  new_coords = []
  coords.each do |coord|
    if coord.first == -1
      new_coords << [0]
    elsif coord.first == 3
      new_coords << [2]
    else
      new_coords << [coord.first]
    end
  end
  new_coords
end

key_pad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

starting_coords = [[1], [1]]
code = ""
input.each do |instruction|
  instruction.split("").each do |direction|
    case direction
    when 'U'
      starting_coords.first[0] -= 1
    when 'D'
      starting_coords.first[0] += 1
    when 'L'
      starting_coords.last[0] -=1
    when 'R'
      starting_coords.last[0] += 1
    end
    starting_coords = fix_coords(starting_coords)
  end
  code << key_pad[starting_coords.first.first][starting_coords.last.first].to_s
end

p code.to_i
