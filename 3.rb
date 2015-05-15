# Problem 3
#
# Write a function that computes the list of the first 100 Fibonacci numbers.
# By definition, the first two numbers in the Fibonacci sequence are 0 and 1, and
# each subsequent number is the sum of the previous two. As an example, here are
# the first 10 Fibonnaci numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, and 34.

require 'test/unit'

class Fibonnaci
  def self.compute(number)
    a=[]
    a[0]=0 if number > 0
    a[1]=1 if number > 1
    (number-2).times{a << (a[-2]+a[-1])} if number > 2
    return a
  end
end

class FibonnaciTest < Test::Unit::TestCase
  def test_fibonnaci_0
    assert_equal [], Fibonnaci.compute(0)
  end
  def test_fibonnaci_1
    assert_equal [0], Fibonnaci.compute(1)
  end
  def test_fibonnaci_5
    assert_equal [0,1,1,2,3], Fibonnaci.compute(5)
  end
  def test_fibonnaci_10
    assert_equal [0,1,1,2,3,5,8,13,21,34], Fibonnaci.compute(10)
  end
end


puts "Computing the first 100 Fibonnaci numbers:"
puts Fibonnaci.compute(100).to_s

