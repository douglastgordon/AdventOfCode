require 'byebug'

triangle_count = 0


def real_triangle?(arr)
  sides_total = arr.inject(:+)
  max = arr.max
  max < (sides_total - max)
end


File.open('d3_p1_input.txt').each do |triangle|
  triangle = triangle.split.map{|el| el.to_i}
  if (real_triangle?(triangle))
    triangle_count += 1
  end
end



p triangle_count
