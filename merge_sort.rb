def merge_sort(array)
  return array if array.length == 1

  halved_length = (array.length / 2.0).round 
  # Sorts left half and right half
  sort(merge_sort(array.first(halved_length)), merge_sort(array.last(array.length - halved_length)))
end

def sort(array1 = [], array2 = [])
  sorted = []
  until array1.empty? || array2.empty?
    if array1[0] < array2[0]
      sorted.push(array1.shift)
    else
      sorted.push(array2.shift)
    end
  end

  if array1.empty?
    sorted.push(*array2.shift(array2.length))
  else
    sorted.push(*array1.shift(array1.length))
  end
  sorted
end

p merge_sort([2, 3, 6, 7, 2, 6, 8, 9, 3, 5, 1])