require 'digest'
require 'byebug'
input = "uqwqemis"

def find_password(input)
  password = ""
  idx = 0
  until password.length == 8
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
    password << md5.hexdigest[5]
  end
  password
end

p find_password(input)
