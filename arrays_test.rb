require 'minitest/autorun'
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'arrays'

class TestArrays < MiniTest::Unit::TestCase
  def setup
    @arrays = Arrays.new
  end
  
  def test_even_odd_placed_elements
    assert_equal [1,3,5,2,4], @arrays.even_odd_placed_elements([1,2,3,4,5])
  end

  def test_odd_even_placed_elements
    assert_equal [2,4,1,3,5], @arrays.odd_even_placed_elements([1,2,3,4,5])
  end

  def test_place_first_greate_than_first_and_less_than_last
    assert_equal 1, @arrays.place_first_greate_than_first_and_less_than_last([1,2,3,4,5])    
    assert_equal [], @arrays.place_first_greate_than_first_and_less_than_last([10,2,3,4,5])
  end

  def test_place_last_greate_than_first_and_less_than_last
    assert_equal 3, @arrays.place_last_greate_than_first_and_less_than_last([1,2,3,4,5])
    assert_equal [], @arrays.place_last_greate_than_first_and_less_than_last([10,2,3,4,5])
  end

  def test_add_first_to_even_elements
    assert_equal [1,3,3,5,5], @arrays.add_first_to_even_elements([1,2,3,4,5])
    assert_equal [2,4,3,6,5,6], @arrays.add_first_to_even_elements([2,2,3,4,5,6])
  end

  def test_add_last_to_even_elements
    assert_equal [1,7,3,9,5], @arrays.add_last_to_even_elements([1,2,3,4,5])
    assert_equal [2,8,3,10,5,6], @arrays.add_last_to_even_elements([2,2,3,4,5,6])
  end

  def test_add_first_to_odd_elements
    assert_equal [1,2,4,4,5], @arrays.add_first_to_odd_elements([1,2,3,4,5])
  end

  def test_add_last_to_odd_elements
    assert_equal [1,2,8,4,5], @arrays.add_last_to_odd_elements([1,2,3,4,5])
  end

  def test_change_all_positive_by_min
    assert_equal [-3,-2,-3,-3,-3], @arrays.change_all_positive_by_min([1,-2,-3,4,5])
  end

  def test_change_all_positive_by_max
    assert_equal [5,-2,-3,5,5], @arrays.change_all_positive_by_max([1,-2,-3,4,5])
  end

  def test_change_all_negative_by_min
    assert_equal [1,-3,-3,4,5], @arrays.change_all_negative_by_min([1,-2,-3,4,5])
  end

  def test_change_all_negative_by_max
    assert_equal [1,5,5,4,5], @arrays.change_all_negative_by_max([1,-2,-3,4,5])
  end

  def test_left_shift
    assert_equal [2,3,4,5,1], @arrays.left_shift([1,2,3,4,5])
  end

  def test_right_shift
    assert_equal [5,1,2,3,4], @arrays.right_shift([1,2,3,4,5])
  end

  def test_arithmetic
    assert_equal 1, @arrays.arithmetic([1,2,3,4,5])
    assert_equal nil, @arrays.arithmetic([1,2,3,5,5])
  end

  def test_geometric
    assert_equal 2, @arrays.geometric([1,2,4,8,16])
    assert_equal 1, @arrays.geometric([5,5,5,5,5])
    assert_equal nil, @arrays.geometric([1,2,3,5,5])
    assert_equal nil, @arrays.geometric([0,0,0,0,0])
  end

  def test_local_minimums
    assert_equal 0, @arrays.local_minimums([1,2,4,8,16])
    assert_equal 1, @arrays.local_minimums([0,2,1,8,16])
  end

  def test_local_maximums
    assert_equal 0, @arrays.local_maximums([1,2,4,8,16])
    assert_equal 1, @arrays.local_maximums([5,5,6,5,5])
  end

  def test_max_of_local_maximums
    assert_equal nil, @arrays.max_of_local_maximums([1,2,4,8,16])
    assert_equal 6, @arrays.max_of_local_maximums([5,5,6,5,5])
    assert_equal 0, @arrays.max_of_local_maximums([-1,-2,0,-3,-4])
  end

  def test_min_of_local_minimums
    assert_equal nil, @arrays.min_of_local_minimums([1,2,3,4,5])
    assert_equal 0, @arrays.min_of_local_minimums([1,0,3,2,5])
    assert_equal -2, @arrays.min_of_local_minimums([1,0,3,-2,5])
  end

  def test_monotonic_increase_count
    assert_equal 1, @arrays.monotonic_increase_count([1,2,3,4])
    assert_equal 1, @arrays.monotonic_increase_count([2,1,3,4,1])
    assert_equal 0, @arrays.monotonic_increase_count([5,4,3,2,1])
  end

  def test_monotonic_decrease_count
    assert_equal 1, @arrays.monotonic_decrease_count([5,4,3,2,1])
    assert_equal 0, @arrays.monotonic_decrease_count([1,2,3,4,5])
  end

  def test_nearest_real_number
    assert_equal 1.00000025, @arrays.nearest_real_number(1.0000003, [1.0000004, 1.00000025, 1.00000035])
  end

  def test_farest_real_number
    assert_equal 1.0000004, @arrays.farest_real_number(1.0000003, [1.0000004, 1.00000025, 1.00000035])
  end

  def test_insert_zero_before_positive
    assert_equal [0,1,0,2,0,3,0,4,-5], @arrays.insert_zero_before_positive([1,2,3,4,-5])
  end

  def test_insert_zero_before_negative
    assert_equal [0,-1,0,-2,0,-3,0,-4,5], @arrays.insert_zero_before_negative([-1,-2,-3,-4,5])
  end

  def test_insert_zero_after_positive
    assert_equal [1,0,2,0,3,0,4,0,-5], @arrays.insert_zero_after_positive([1,2,3,4,-5])
  end

  def test_insert_zero_after_negative
    assert_equal [-1,0,-2,0,-3,0,-4,0,5], @arrays.insert_zero_after_negative([-1,-2,-3,-4,5])
  end

  def test_increase_sort
    assert_equal [1,2,3,4,5], @arrays.increase_sort([5,4,3,2,1])
  end

  def test_decrease_sort
    assert_equal [5,4,3,2,1], @arrays.decrease_sort([1,2,3,4,5])
  end

  def test_decreasing_sequence_index
    assert_equal [4,3,2,1,0], @arrays.decreasing_sequence_index([1,2,3,4,5])
  end

  def test_increasing_sequence_index
    assert_equal [0,1,2,3,4], @arrays.increasing_sequence_index([1,2,3,4,5])
  end

  def test_min_index
    assert_equal 1, @arrays.min_index([2,1,3,1,5])
  end

  def test_max_index
    assert_equal 1, @arrays.max_index([2,6,3,6,5])
  end

  def test_min_first_index
    assert_equal 1, @arrays.min_first_index([2,1,3,1,5])
  end

  def test_max_first_index
    assert_equal 1, @arrays.max_first_index([2,6,3,6,5])
  end

  def test_min_last_index
    assert_equal 3, @arrays.min_last_index([2,1,3,1,5])
  end

  def test_max_last_index
    assert_equal 3, @arrays.max_last_index([2,6,3,6,5])
  end

  def test_min_quantity
    assert_equal 2, @arrays.min_quantity([2,1,3,1,5])
  end

  def test_max_quantity
    assert_equal 2, @arrays.max_quantity([2,6,3,6,5])
  end

  def test_min_even
    assert_equal 2, @arrays.min_even([1,2,3,4,5])
  end

  def test_min_odd
    assert_equal 1, @arrays.min_odd([0,1,2,3,4,5])
  end

  def test_max_even
    assert_equal 4, @arrays.max_even([1,2,3,4,5])
  end

  def test_max_odd
    assert_equal 5, @arrays.max_odd([1,2,3,4,5,6])
  end

  def test_min_positive
    assert_equal 2, @arrays.min_positive([-1,0,2,3,5,0,-2])
  end

  def test_max_negative
    assert_equal -2, @arrays.max_negative([-4,-3,-2,0,1,0])
  end

  def test_min_on_interval
    assert_equal 2, @arrays.min_on_interval(2..5, [1,2,2,4,5,6,7,8,9])
  end

  def test_max_on_interval
    assert_equal 6, @arrays.max_on_interval(2..5, [1,2,2,4,5,6,7,8,9])
  end

  def test_quantity_before_min
    assert_equal 1, @arrays.quantity_before_first_min([2,1,3,1,5])
  end

  def test_quantity_before_max
    assert_equal 4, @arrays.quantity_before_first_max([2,1,3,1,5,4])
  end

  def test_quantity_after_first_min
    assert_equal 6, @arrays.quantity_after_first_min([-1,0,2,3,5,0,-2,5,6,7,8,9,-2])
  end

  def test_quantity_after_first_max
    assert_equal 11, @arrays.quantity_after_first_max([-1,10,2,3,5,0,-2,5,6,7,8,10,-2])
  end

  def test_quantity_before_last_min
    assert_equal 7, @arrays.quantity_before_last_min([-1,0,2,3,5,0,-2,-2,5,6,7,8,9])
  end

  def test_quantity_before_last_max
    assert_equal 11, @arrays.quantity_before_last_max([-1,10,2,3,5,0,-2,5,6,7,8,10,-2])
  end

  def test_quantity_after_last_min
    assert_equal 5, @arrays.quantity_after_last_min([-1,0,2,3,5,0,-2,-2,5,6,7,8,9])
  end

  def test_quantity_after_last_max
    assert_equal 1, @arrays.quantity_after_last_max([-1,10,2,3,5,0,-2,5,6,7,8,10,-2])
  end

  def test_first_extreme_index
    assert_equal 1, @arrays.first_extreme_index([-1,10,2,3,5,0,-2,5,6,7,8,10,-2])
    assert_equal 0, @arrays.first_extreme_index([5,5,5,5,5])
  end

  def test_last_extreme_index
    assert_equal 12, @arrays.last_extreme_index([-1,10,2,3,5,0,-2,5,6,7,8,10,-2])
    assert_equal 4, @arrays.last_extreme_index([5,5,5,5,5])
  end

  def test_quantity_between_deadline_minimums
    assert_equal 5, @arrays.quantity_between_deadline_minimums([-1,10,2,3,5,0,-2,5,6,7,8,10,-2])
    assert_equal 0, @arrays.quantity_between_deadline_minimums([-1,10,2,3,5,0,-2,-2,5,6,7,8,10])
    assert_equal 0, @arrays.quantity_between_deadline_minimums([-1,10,2,3,5,0,-2,5,6,7])
  end

  def test_quantity_between_deadline_maximums
    assert_equal 9, @arrays.quantity_between_deadline_maximums([-1,10,2,3,5,0,-2,5,6,7,8,10,-2])
    assert_equal 0, @arrays.quantity_between_deadline_maximums([-1,10,10,2,3,5,0,-2,-2,5,6,7,8])
    assert_equal 0, @arrays.quantity_between_deadline_maximums([-1,10,2,3,5,0,-2,5,6,7])
  end
end