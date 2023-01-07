def substrings(string, dictionary)
  filtered_string = string.downcase
  matches = 
    dictionary.each_with_object([]) do |value, array| 
      array.concat(filtered_string.scan(value.downcase)) unless filtered_string.scan(value.downcase).empty?
    end
  matches.tally
end