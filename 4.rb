# Problem 4
#
# Write a function that given a list of non negative integers, arranges them such
# that they form the largest possible number. For example, given [50, 2, 1, 9],
# the largest formed number is 95021.
#
# Update: Apparently this problem got a lot of people talking (although not as
# much as Problem 5 below.) You can click here to read my solution.

require 'test/unit'

class Orderer
  def self.largest_concatenated_number(a_in)
    return a_in.map(&:to_s).sort{|x,y| y+x <=> x+y}.join.to_i
  end
end

class OrdererTest < Test::Unit::TestCase
  def test_largest_concatenated_number_1
    assert_equal 95021, Orderer.largest_concatenated_number([50,2,1,9])
  end
  def test_largest_concatenated_number_2
    assert_equal 997763523, Orderer.largest_concatenated_number([352,3,99,7,76])
  end
  def test_largest_concatenated_number_3
    assert_equal 999988433, Orderer.largest_concatenated_number([4,33,99,9988])
  end
  def test_largest_concatenated_number_4
    assert_equal 56550, Orderer.largest_concatenated_number([5,50,56])
  end
  def test_largest_concatenated_number_5
    assert_equal 42423420, Orderer.largest_concatenated_number([420,42,423])
  end
  def test_largest_concatenated_number_6
    assert_equal 5523, Orderer.largest_concatenated_number([52,5,3])
  end

end

# Another way is to monkeypatch the Array class.

class Array
  def largest_concatenated_number
    return self.map(&:to_s).sort{|x,y| y+x <=> x+y}.join.to_i
  end
end

class ArrayTest < Test::Unit::TestCase
  def test_largest_concatenated_number
    assert_equal 42423420, [420,42,423].largest_concatenated_number
  end
end

