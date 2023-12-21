# Simple encryption for conversations
$CC_LOCK= 5
$LETTERS = ("a".."z").each.with_index(1).to_h

puts ("Enter you secret message ->  ")
message = gets.chomp

#convert each letter with the CC_lock
def cc_convert (word)
  new_w = []
  code = []
  word.split("").each do |chr|
    if chr.match?(/\A[a-z]\z/)
      new_w.push(chr == chr.upcase ? ($LETTERS.key($LETTERS[chr.downcase]+$CC_LOCK)).upcase 
      : $LETTERS.key($LETTERS[chr]+ $CC_LOCK))
    else new_w.push(chr)
    end
  end
  return new_w.join('')
end

puts cc_convert(message)
# if the char + cc_lock is greater than 26, minus 26 from it and print that letter

# this works, but runs into an issue when you move past the hash value