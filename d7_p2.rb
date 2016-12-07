require 'byebug'
ips = []
File.open('d7_input.txt').each do |line|
  ips << line.chomp
end


 # def find_abas(ip)
 #   i = 0
 #   abas = []
 #   inside_brackets = false
 #   while i < ip.length - 2
 #
 #     if ip.chars[i] == "["
 #       inside_brackets = true
 #     elsif ip.chars[i] == "]"
 #       inside_brackets = false
 #     end
 #
 #
 #    if ip.chars[i] == ip.chars[i+2] && !inside_brackets
 #      abas  << [ip.chars[i], ip.chars[i+1], ip.chars[i+2]]
 #    end
 #     i += 1
 #   end
 #   abas
 #  #  debugger
 # end


def abas_and_babs(ip)
  i = 0
  abas = []
  flipped_babs = []
  inside_brackets = false

  while i < ip.length - 2

    if ip.chars[i] == "["
      inside_brackets = true
      i += 1
      next
    elsif ip.chars[i] == "]"
      inside_brackets = false
      i += 1
      next
    end

    if inside_brackets && ip[i] == ip[i+2]
      flipped_bab = "#{ip[i+1]}#{ip[0]}#{ip[i+1]}"
      flipped_babs << ip[i..(i+2)]
    elsif !inside_brackets && ip[i] == ip[i+2] && ip[i] != ip[i+1]
      # debugger
      abas << ip[i..(i+2)]
    end
    # puts "#{ip[i]}#{ip[i+1]}#{ip[i+2]}"
    i += 1
  end
  ssl?(abas, flipped_babs)
end

def ssl?(abas, flipped_babs)
  abas.each do |aba|
    if flipped_babs.include?(aba)
      return true
    end
  end
  false
end

ssl_count = 0
m = 0
ips.each do |ip|
  m += 1
  ssl_count += 1 if abas_and_babs(ip)
  puts m
end

p ssl_count


# def find_babs(ip)
#   i = 0
#   babs = []
#   inside_brackets = false
#   while i < ip.length - 2
#
#     if ip.chars[i] == "["
#       inside_brackets = true
#     elsif ip.chars[i] == "]"
#       inside_brackets = false
#     end
#
#
#    if ip.chars[i] == ip.chars[i+2] && inside_brackets
#      babs  << [ip.chars[i], ip.chars[i+1], ip.chars[i+2]]
#    end
#     i += 1
#   end
#   flip(babs)
# end
#
#
# def flip(babs)
#   flipped_babs = []
#   babs.each do |bab|
#     flipped_babs << [bab[1],bab[0],bab[1]]
#   end
#   flipped_babs
# end
#
#
# i = 0
# ssl_support = 0
#
# ips.each do |ip|
#   i += 1
#   abas = find_abas(ip)
#   babs = find_babs(ip)
#   abas.each do |aba|
#     # debugger
#     if babs.include?(aba)
#       # debugger
#       ssl_support += 1
#       break
#     end
#   end
#   puts i
# end
#
# p ssl_support
