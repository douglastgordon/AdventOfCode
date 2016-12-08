ROWS = 6
COLUMNS = 50

@screen = Array.new(ROWS) { Array.new(COLUMNS, 0) }

def turn_on(x, y)
  i = 0
  while i < x
    j = 0
    while j < y
      @screen[j][i] = 1
      j += 1
    end
    i += 1
  end
end

def rotate_row(row, num)
  num = num % COLUMNS
  first_chunk = @screen[row][(COLUMNS - num)..-1]
  last_chunk = @screen[row][0...(COLUMNS - num)]
  @screen[row] = first_chunk.concat(last_chunk)
end


def rotate_column(col, num)
  rotated_screen = @screen.transpose
  num = num % ROWS
  first_chunk = rotated_screen[col][(ROWS - num)..-1]
  last_chunk = rotated_screen[col][0...(ROWS - num)]
  rotated_screen[col] = first_chunk.concat(last_chunk)
  @screen = rotated_screen.transpose
end


def parse_for_turn_on(dimensions)
  dimensions = dimensions.split("x")
  turn_on(dimensions[0].to_i, dimensions[1].to_i)
end

def parse_for_row(row, num)
  row = row.split("=")
  rotate_row(row[1].to_i, num.to_i)
end

def parse_for_col(col, num)
  col = col.split("=")
  rotate_column(col[1].to_i, num.to_i)
end


File.open('d8_input.txt').each do |line|
  line = line.chomp.split(" ")
  if line[0] == "rect"
    parse_for_turn_on(line[1])
  elsif line[1] == "row"
    parse_for_row(line[2], line[4])
  else
    parse_for_col(line[2], line[4])
  end
end

p @screen.flatten.inject(:+)


# tests
# turn_on(3,2)
# rotate_column(1, 1)
# rotate_row(0, 4)
# rotate_column(1, 1)
# print screen
# @screen.each do |row|
#   print row
#   puts
# end
