input = []
File.open('d2_p1_input.txt').each do |line|
  input << line.chomp
end

key_pad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

input_correspondences = {
  'U' => 1,
  'D' => -1
}
p input
