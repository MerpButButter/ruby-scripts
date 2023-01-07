def fibs(n)
  fibonacci_list = []
  last_n = 0
  current_n = 0
  next_n = 1
  n.times do
    current_n += last_n
    last_n = next_n
    next_n = current_n
    fibonacci_list.push(current_n)
  end
  fibonacci_list
end

def fibs_rec(n, last_n = 0, current_n = 0, next_n = 1, list = [])
  return list if n.zero?

  current_n += last_n
  last_n = next_n
  next_n = current_n
  fibs_rec(n - 1, last_n, current_n, next_n, list.push(current_n))
end

p fibs(8)
p fibs_rec(8)
