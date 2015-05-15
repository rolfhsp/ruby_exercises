# Problem 2
#
# Write a function that combines two lists by alternatingly taking elements.
# For example: given the two lists [a, b, c] and [1, 2, 3], the function should
# return [a, 1, b, 2, c, 3].

require 'test/unit'

class Zipper
  def self.zip(a1, a2)
    a = []
    while (a1.length > 0) && (a2.length > 0)
      a << a1.shift
      a << a2.shift
    end
    return a
  end
  def self.zip2(a1,a2)
    a = []
    [a1.length, a2.length].min.times{|i| a << a1[i] << a2[i] }
    return a
  end

end

class ZipperTest < Test::Unit::TestCase
  def setup
    @a1 = ['a']
    @a2 = ['a', 'b', 'c', 'd']
    @a3 = [1, 2]
    @a4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end
  
  def test_zip_1
    assert_equal [], Zipper.zip( [], @a2)
  end
  def test_zip_2
    assert_equal [], Zipper.zip( @a2, [])
  end
  def test_zip_3
    assert_equal ['a', 1], Zipper.zip( @a1, @a3)
  end
  def test_zip_4
    assert_equal ['a', 1, 'b', 2], Zipper.zip( @a2, @a3)
  end
  def test_zip_5
    assert_equal ['a', 1, 'b', 2, 'c', 3, 'd', 4], Zipper.zip( @a2, @a4)
  end
  def test_zip_alternative
    assert_equal Zipper.zip( @a2.dup, @a4.dup ), Zipper.zip2( @a2.dup, @a4.dup )
  end
  def test_zip_compare_with_ruby_zip
    assert_equal Zipper.zip( @a2.dup, @a4.dup ), @a2.zip(@a4).flatten
  end
end

# Test performance
require 'rubyperf'
puts '-- Performance --'
m=Perf::Meter.new
m.measure(:example) do
  100000.times { Zipper.zip([0,2,4,6,8],[1,3,5,7,9]) }
end
puts m.report_simple

puts '-- Performance 2 --'
m=Perf::Meter.new
m.measure(:example) do
  100000.times { Zipper.zip2([0,2,4,6,8],[1,3,5,7,9]) }
end
puts m.report_simple

puts '-- Performance standard ruby zip --'

m=Perf::Meter.new
m.measure(:example) do
  100000.times { [0,2,4,6,8].zip([1,3,5,7,9]).flatten }
end
puts m.report_simple
