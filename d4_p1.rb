rooms = []
File.open('d4_input.txt').each do |line|
  rooms << line
end


LETTERS = ('a'..'z').to_a
NUMBERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def sum_real_rooms(rooms)
  sum = 0
  rooms.each do |room|
    frequency_hash = frequency_hash(room)
    check_sum = check_sum(room)
    sector_id = sector_id(room)
    if real_room?(frequency_hash, check_sum)
      sum += sector_id
    end
  end
  sum
end

def frequency_hash(room)
  hash = Hash.new(0)
  room.chars.each do |char|
    if LETTERS.include?(char)
      hash[char] += 1
    end
  end
  hash
end

def check_sum(room)
  arr = []
  last_section = room.split("-")[-1]
  last_section.chars.each do |char|
    if LETTERS.include?(char)
      arr << char
    end
  end
  arr
end

def sector_id(room)
  id = ""
  room.chars.each do |char|
    if NUMBERS.include?(char)
      id << char
    end
  end
  id.to_i
end

def real_room?(hash, check_sum)
  top_five = ""

  until top_five.length == 5
    max_letter = 0
    current_max = 0
    LETTERS.each do |letter|
      if hash[letter] > current_max
        current_max = hash[letter]
        max_letter = letter
      end
    end
    top_five << max_letter
    hash[max_letter] = 0
  end

  top_five.split("").sort.join("") == check_sum.sort.join("")
end

p sum_real_rooms(rooms)
