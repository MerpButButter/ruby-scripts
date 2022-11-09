def caesar_cipher(string, shift)
  alphabet_downcase = ("a".."z").to_a
  alphabet_upcase = ("A".."Z").to_a
  characters = string.chars

  ciphered_characters = 
    characters.map do |chr|
      if alphabet_downcase.one?(chr) || alphabet_upcase.one?(chr) 
        if chr == chr.upcase 
          alphabet_upcase[wrap_array_position(alphabet_upcase, alphabet_upcase.find_index(chr) + shift)]
        elsif chr == chr.downcase 
          alphabet_downcase[wrap_array_position(alphabet_downcase, alphabet_downcase.find_index(chr) + shift)]
        else
          chr
        end
      else
        chr
      end
    end

  ciphered_characters.join
end

def wrap_array_position(array, position)
  (position % array.count + array.count) % array.count
end

p caesar_cipher("What a string!", 5)