def substrings(string, dictionary)
  filtered_string = string.downcase
  matches = 
    dictionary.reduce([]) do |array, value| 
      array.concat(filtered_string.scan(value.downcase)) unless filtered_string.scan(value.downcase).empty?
      array
    end
  matches.tally
end