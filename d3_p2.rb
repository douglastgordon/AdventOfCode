require 'byebug'
triangle_count = 0

def real_triangle?(arr)
  sides_total = arr.inject(:+)
  max = arr.max
  max < (sides_total - max)
end

triangles = []

File.open('d3_p1_input.txt').each do |triangle|
  triangle = triangle.split.map{|el| el.to_i}
  triangles << triangle
end

triangloues = triangles.transpose
triangles.each do |row|
  i = 0
  while i < row.length - 2
    if real_triangle?([ row[i], row[i+1], row[i+2] ])
      triangle_count += 1
    end
    i += 3
  end
end



p triangle_count
