# frozen_string_literal: true

# ceaser cypher to decrypt string messages
class CeaserCypher
  LETTERS = ('a'..'z').each.with_index(1).to_h

  def initialize(decode_key)
    @key = decode_key
  end

  def encrypt(message = '')
    code = []
    message.split('').each do |chr|
      if chr.is_a?(String) && chr.downcase.match?(/\A[a-z]\z/)
        decoded = LETTERS.key(convert_chr(chr)) # retrive the chr
        code << (chr == chr.upcase ? decoded.upcase : decoded)
      else
        code << chr
      end
    end
    display_message(code)
  end

  def decrypt(message = '')
    code = []
    message.split('').each do |chr|
      if chr.is_a?(String) && chr.downcase.match?(/\A[a-z]\z/)
        decoded = LETTERS.key(convert_chr_back(chr))
        code << (chr == chr.upcase ? decoded.upcase : decoded)
      else
        code << chr
      end
    end
    display_message(code)
  end

  private

  def display_message(message)
    message.join('')

  end

  def convert_chr(chr)
    num = chr.downcase.ord - 96 + @key
    num < 26 ? (return num) : nil
    num -= @key
    @key.times do
      num = 1 if num >= 26
      num += 1
    end
    num
  end

  def convert_chr_back(chr)
    num = chr.downcase.ord - 96 - @key
    num.between?(1, 26) ? (return num) : nil
    num += @key
    @key.times do
      num = 26 if num <= 0
      num -= 1
    end
    num
  end
end
