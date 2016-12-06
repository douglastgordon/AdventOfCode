pos1 = Hash.new(0)
pos2 = Hash.new(0)
pos3 = Hash.new(0)
pos4 = Hash.new(0)
pos5 = Hash.new(0)
pos6 = Hash.new(0)
pos7 = Hash.new(0)
pos8 = Hash.new(0)

pos_arr = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8]

File.open('d6_input.txt').each do |line|
  line.chomp.chars.each_with_index do |char, i|
    pos_arr[i][char] += 1
  end
end


def min(hash)
  current_min = 100
  lowest = ""
  hash.each do |k, v|
    if v < current_min
      current_min = v
      lowest = k
    end
  end
  lowest
end

output = []

pos_arr.each do |pos_hash|
  output << min(pos_hash)
end

p output.join
