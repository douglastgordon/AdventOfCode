ips = []
File.open('d7_input.txt').each do |line|
  ips << line
end

support_tls = 0

ips.each do |ip|
  inside_brackets = false
  supporting = false
  i = 0
  while i < ip.length - 3
    if ip.chars[i] == "["
      inside_brackets = true
    elsif ip.chars[i] == "]"
      inside_brackets = false
    end

    if ip.chars[i] == ip.chars[i+3] &&
        ip.chars[i+1] == ip.chars[i+2] &&
        inside_brackets
        supporting = false
        break
    elsif ip.chars[i] == ip.chars[i+3] &&
        ip.chars[i+1] == ip.chars[i+2] &&
        ip.chars[i] != ip.chars[i+1]
        supporting = true
    end
    i += 1
  end

  support_tls += 1 if supporting
end

p support_tls
