class Arrays
  def even_odd_placed_elements(array)
    (array.map.with_index{ |x, i| x if i.even? } + array.map.with_index{ |x, i| x if i.odd? }).compact
  end

  def odd_even_placed_elements(array)
    (array.map.with_index{ |x, i| x if i.odd? } + array.map.with_index{ |x, i| x if i.even? }).compact
  end

  def place_first_greate_than_first_and_less_than_last(array)
    return [] if array.first > array.last
    array.each.with_index { |el, i| return i if array.first < el && el < array.last } || []
  end

  def place_last_greate_than_first_and_less_than_last(array)
    return [] if array.first > array.last
    array.reverse!
    array.each.with_index { |el, i| return array.length - i - 1 if array.last < el && el < array.first } || []
  end

  def add_first_to_even_elements(array)
    #array.map!.with_index { |el, i| el.even? && i != 0 && i != array.size - 1 ? el + array.first : el }
    array.replace([array.first, array[1..-2].map { |el| el.even? ? el + array.first : el } ,array.last]).flatten!
  end

  def add_last_to_even_elements(array)
    array.map!.with_index { |el, i| el.even? && i != 0 && (i != array.size - 1) ? el + array.last : el }
  end

  def add_first_to_odd_elements(array)
    array.map!.with_index { |el, i| el.odd? && i != 0 && i != array.size - 1 ? el + array.first : el }
  end

  def add_last_to_odd_elements(array)
    array.map!.with_index { |el, i| el.odd? && i != 0 && i != array.size - 1 ? el + array.last : el }
  end

  def change_all_positive_by_min(array)
    min = array.min
    array.map { |el| el > 0 ? min : el}
  end

  def change_all_positive_by_max(array)
    max = array.max
    array.map { |el| el > 0 ? max : el }
  end

  def change_all_negative_by_min(array)
    min = array.min
    array.map { |el| el < 0 ? min : el}
  end

  def change_all_negative_by_max(array)
    max = array.max
    array.map { |el| el < 0 ? max : el }
  end

  def left_shift(array)
    array.push array.shift
  end

  def right_shift(array)
    array.unshift array.pop
  end

  def arithmetic(array)
    step = array[1] - array.first
    array[1..-2].each_cons(2) { |th, n| return if n - th != step }
    step
  end

  def geometric(array)
    return if array[1] == 0 || array.first == 0
    step = array[1] / array.first
    array[1..-2].each_cons(2) { |th, n| return if n/th != step || th == 0 }
    step
  end

  def local_minimums(array)
    count = 0
    array.each_cons(3) { |a,b,c| count += 1 if b < a && b < c }
    count
  end

  def local_maximums(array)
    count = 0
    array.each_cons(3) { |a,b,c| count += 1 if b > a && b > c }
    count
  end

  def max_of_local_maximums(array)
    cand = nil
    array.each_cons(3) do |a,b,c|
      if b > a && b > c
        cand = b if cand.nil? || cand < b
      end
    end
    cand
  end

  #20
  def min_of_local_minimums(array)
    cand = nil
    array.each_cons(3) do |a,b,c|
      if b < a && b < c
        cand = b if cand.nil? || cand > b
      end
    end
    cand
  end

  def monotonic_increase_count(array)
    count = 0
    array.unshift array.first
    array.push array.last
    array.each_cons(3) { |a,b,c| count += 1 if b > a && b >= c }
    count
  end

  def monotonic_decrease_count(array)
    count = 0
    array.unshift array.first
    array.push array.last
    array.each_cons(3) { |a,b,c| count += 1 if b < a && b <= c }
    count
  end

  def nearest_real_number(num, array)
    array.inject(array.first) { |res, n| (num - res).abs > (num - n).abs ? n : res }
  end

  def farest_real_number(num, array)
    array.inject(array.first) { |res, n| (num - res).abs < (num - n).abs ? n : res }
  end

  def insert_zero_before_positive(array)
    array.map { |el| el > 0 ? [0, el] : el }.flatten
  end

  def insert_zero_before_negative(array)
    array.map { |el| el < 0 ? [0, el] : el }.flatten
  end

  def insert_zero_after_positive(array)
    array.map { |el| el > 0 ? [el, 0] : el }.flatten
  end

  def insert_zero_after_negative(array)
    array.map { |el| el < 0 ? [el, 0] : el }.flatten
  end

  def increase_sort(array)
    array.sort { |x,y| x <=> y }
  end

  def decrease_sort(array)
    array.sort { |x,y| y <=> x}
  end

  def decreasing_sequence_index(array)
    modify = []
    array.each_with_index { |a,i| modify << [a,i]}
    modify.sort { |x,y| y.first <=> x.first }.map(&:last)
  end

  def increasing_sequence_index(array)
    modify = []
    array.each_with_index { |a,i| modify << [a,i]}
    modify.sort { |x,y| x.first <=> y.first }.map(&:last)
  end

  def min_index(array)
    array.index(array.min)
  end

  def max_index(array)
    array.index(array.max)
  end

  alias_method :min_first_index, :min_index
  alias_method :max_first_index, :max_index

  def min_last_index(array)
    array.rindex(array.min)
  end

  def max_last_index(array)
    array.rindex(array.max)
  end

  def min_quantity(array)
    array.count(array.min)
  end

  def max_quantity(array)
    array.count(array.max)
  end

  def min_even(array)
    array.map { |a| a if a.even? }.compact.min
  end

  def min_odd(array)
    array.map { |a| a if a.odd? }.compact.min
  end

  def max_even(array)
    array.map { |a| a if a.even? }.compact.max
  end

  def max_odd(array)
    array.map { |a| a if a.odd? }.compact.max
  end

  def min_positive(array)
    array.map { |a| a if a > 0 }.compact.min
  end

  def max_negative(array)
    array.map { |a| a if a < 0 }.compact.max
  end

  def min_on_interval(interval, array)
    array[interval].min
  end

  def max_on_interval(interval, array)
    array[interval].max
  end

  alias_method :quantity_before_min, :min_index
  alias_method :quantity_before_max, :max_index
end