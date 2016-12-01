require 'byebug'
input = "R5, R4, R2, L3, R1, R1, L4, L5, R3, L1, L1, R4, L2, R1, R4, R4, L2, L2, R4, L4, R1, R3, L3, L1, L2, R1, R5, L5, L1, L1, R3, R5, L1, R4, L5, R5, R1, L185, R4, L1, R51, R3, L2, R78, R1, L4, R188, R1, L5, R5, R2, R3, L5, R3, R4, L1, R2, R2, L4, L4, L5, R5, R4, L4, R2, L5, R2, L1, L4, R4, L4, R2, L3, L4, R2, L3, R3, R2, L2, L3, R4, R3, R1, L4, L2, L5, R4, R4, L1, R1, L5, L1, R3, R1, L2, R1, R1, R3, L4, L1, L3, R2, R4, R2, L2, R1, L5, R3, L3, R3, L1, R4, L3, L3, R4, L2, L1, L3, R2, R3, L2, L1, R4, L3, L5, L2, L4, R1, L4, L4, R3, R5, L4, L1, L1, R4, L2, R5, R1, R1, R2, R1, R5, L1, L3, L5, R2"

def first_location_visited_twice(input)
  input = input.split(", ")
  horizontal_distance = 0
  vertical_distance = 0

  cardinal_directions = ['N', 'E', 'S', 'W']
  cardinal_direction_idx = 0

  locations_visited = [[0,0]]

  input.each do |instruction|

    direction = instruction[0]
    distance = instruction[1..-1].to_i
    if direction == 'R'
      cardinal_direction_idx += 1
    elsif direction == 'L'
      cardinal_direction_idx -= 1
    end

    if cardinal_direction_idx == -1
      cardinal_direction_idx = 3
    elsif cardinal_direction_idx == 4
      cardinal_direction_idx = 0
    end

    last_visited = locations_visited[-1]

    case cardinal_directions[cardinal_direction_idx]
    when 'N'
      vertical_distance += distance

      i = 1
      until i > distance
        new_spot = [last_visited[0] + i, last_visited[1]]
        return new_spot[0].abs + new_spot[1].abs if locations_visited.include?(new_spot)
        locations_visited << new_spot
        i += 1
      end

    when 'S'
      vertical_distance -= distance

      i = 1
      until i > distance
        new_spot = [last_visited[0] - i, last_visited[1]]
        return new_spot[0].abs + new_spot[1].abs if locations_visited.include?(new_spot)
        locations_visited << new_spot
        i += 1
      end

    when 'E'
      horizontal_distance += distance

      i = 1
      until i > distance
        new_spot = [last_visited[0], last_visited[1] + i]
        return new_spot[0].abs + new_spot[1].abs if locations_visited.include?(new_spot)
        locations_visited << new_spot
        i += 1
      end

    when 'W'
      horizontal_distance -= distance

      i = 1
      until i > distance
        new_spot = [last_visited[0], last_visited[1] - i]
        return new_spot[0].abs + new_spot[1].abs if locations_visited.include?(new_spot)
        locations_visited << new_spot
        i += 1
      end

    end


  end
  nil
end

p first_location_visited_twice(input)
