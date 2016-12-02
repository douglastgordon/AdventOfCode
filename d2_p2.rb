require 'byebug'
input = []
File.open('d2_p1_input.txt').each do |line|
  input << line.chomp
end


KEY_PAD = [[1],
        [2, 3, 4],
      [5, 6, 7, 8, 9],
     ['A', 'B', 'C'],
          ['D']]

def in_bounds?(coords)
  if coords[0][0] > 4 ||
    KEY_PAD[coords[0][0]][coords[1][0]].nil? ||
    coords[0][0] < 0 ||
    coords[1][0] < 0
    return false
  else
    true
  end
end

starting_coords = [[2], [0]]
code = []
input.each do |instruction|
  instruction.split("").each do |direction|
    case direction
    when 'U'
      starting_coords.first[0] -= 1 if in_bounds?([[starting_coords[0][0]-1], [starting_coords[1][0]]])
    when 'D'
      starting_coords.first[0] += 1 if in_bounds?([[starting_coords[0][0]+1], [starting_coords[1][0]]])
    when 'L'
      starting_coords.last[0] -= 1 if in_bounds?([[starting_coords[0][0]], [starting_coords[1][0]-1]])
    when 'R'
      starting_coords.last[0] += 1 if in_bounds?([[starting_coords[0][0]], [starting_coords[1][0]+1]])
    end
  end
  digit = KEY_PAD[starting_coords.first.first][starting_coords.last.first]
  code << digit
end

p code.join("")
