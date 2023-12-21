# Simple encryption for conversations
# using the ord method
code =[]
$LETTERS = ("a".."z").each.with_index(1).to_h
$CC_LOCK = 3

def n_loop(chr)
  if (num = chr.downcase.ord - 96 + $CC_LOCK) > 26
    num -= $CC_LOCK
    $CC_LOCK.times  do
      num += 1
      if num>26 
        num = 1
      end
    end
  end
  return num
end

print ("Enter your secret message here > ")
message = gets.chomp

message.split("").each do |chr|
  if chr.is_a?(String) && chr.downcase.match?(/\A[a-z]\z/)
    code.push(chr == chr.upcase ? ($LETTERS.key(n_loop(chr))).upcase
    : $LETTERS.key(n_loop(chr)))
  else code.push(chr)
  end
end
puts code.join('')