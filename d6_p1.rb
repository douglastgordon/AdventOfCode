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


def max(hash)
  current_max = 0
  highest = ""
  hash.each do |k, v|
    if v > current_max
      current_max = v
      highest = k
    end
  end
  highest
end

output = []

pos_arr.each do |pos_hash|
  output << max(pos_hash)
end

p output.join
