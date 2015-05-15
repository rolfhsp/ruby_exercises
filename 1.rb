# Problem 1
#
# Write three functions that compute the sum of the numbers in a given list
# using a for-loop, a while-loop, and recursion.
require "test/unit"

class Summer
  def self.sum_for(list=[0])
    sum = 0
    for i in 0..list.length-1 do
      sum += list[i]
    end
    return sum
  end
  
  def self.sum_while(list=[0])
    sum, i = 0, 0
    while i<list.length do
      sum += list[i]
      i+=1
    end
    return sum
  end
  
  def self.sum_recursion(list=[0])
    return list.length<2 ? list.shift : list.shift + sum_recursion(list)
  end
end

class TestSummer < Test::Unit::TestCase

  def setup
    @list = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @list_sum = 55
  end

  def test_for
    assert_equal @list_sum, Summer.sum_for(@list)
  end
  
  def test_while
    assert_equal @list_sum, Summer.sum_while(@list)
  end
  
  def test_recursion
    assert_equal @list_sum, Summer.sum_recursion(@list)
  end
end
