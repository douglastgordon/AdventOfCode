require 'digest'
require 'byebug'
input = "uqwqemis"

RANGE = (0..7).to_a.map{|el| el.to_s}

def find_password(input)
  password = Array.new(8)
  idx = 0
  until full?(password)
    to_digest = input + idx.to_s
    md5 = Digest::MD5.new
    md5.update(to_digest)
    until md5.hexdigest[0..4] == "00000"
      idx += 1
      to_digest = input + idx.to_s
      md5 = Digest::MD5.new
      md5.update(to_digest)
    end
    idx += 1
    arr_idx = md5.hexdigest[5]
    if RANGE.include?(arr_idx)
      password[arr_idx.to_i] = md5.hexdigest[6] if password[arr_idx.to_i].nil?
    end
    p password
  end
  password.join("")
end

def full?(arr)
  arr.each do |el|
    return false if el.nil?
  end
  true
end

p find_password(input)
