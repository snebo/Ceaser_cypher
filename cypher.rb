# Simple encryption for conversations
# using the ord method
code =[]
$LETTERS = ("a".."z").each.with_index(1).to_h
$CC_LOCK = 3

def n_loop(chr)
  num = chr.downcase.ord - 96 + $CC_LOCK
  # if z => 26 + 3

  if num > 26
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

# $CC_LOCK= 5
# $LETTERS = ("a".."z").each.with_index(1).to_h

# puts ("Enter you secret message ->  ")
# message = gets.chomp

# #convert each letter with the CC_lock
# def cc_convert (word)
#   new_w = []
#   code = []
#   word.split("").each do |chr|
#     if chr.match?(/\A[a-z]\Z/)
#       new_w.push(chr == chr.upcase ? ($LETTERS.key($LETTERS[chr.downcase]+$CC_LOCK)).upcase 
#       : $LETTERS.key($LETTERS[chr]+ $CC_LOCK))
#     else new_w.push(chr)
#     end
#   end
#   return new_w.join('')
# end

# puts cc_convert(message)
