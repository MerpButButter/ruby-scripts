def bubble_sort(array)
  sort_array = array
  last_sort_array = []

  # Loop unitl it is all sorted
  until last_sort_array == sort_array
    last_sort_array = sort_array.map(&:clone)
    # Sorting block
    array.each_with_index do |number, i|
      next unless (number <=> sort_array[i + 1]) == 1

      next_n = sort_array[i + 1]
      current_n = sort_array[i]
      sort_array[i + 1] = current_n
      sort_array[i] = next_n
    end
  end

  sort_array
end

p bubble_sort([10, 20, 40, 1, 3, 69, 14])