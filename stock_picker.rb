def stock_picker(stock)
  overall_scores =
    stock.reduce([]) do |array, day|
      since_day = stock.slice_before(day).to_a.last
      overall_score = since_day.reduce(0) { |total, number| total + (number - day) }
      array.push(overall_score)
    end
  best_buy = overall_scores.find_index(overall_scores.max)
  best_sell = stock.find_index(stock.slice_before(stock[best_buy]).to_a.last.max)
  [best_buy, best_sell]
end

p stock_picker([17, 11, 6, 9, 15, 8, 6, 1, 10])