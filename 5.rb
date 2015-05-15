# Problem 5
#
# Write a program that outputs all possibilities to put + or - or nothing between
# the numbers 1, 2, ..., 9 (in this order) such that the result is always 100.
# For example: 1 + 2 + 34 - 5 + 67 - 8 + 9 = 100.

class Make100
  def self.make_100
    [:+,:-,nil].repeated_permutation(8).each do |ops|
      eval_string=[1,2,3,4,5,6,7,8,9].zip(ops).join
      puts eval_string if eval(eval_string) == 100
    end
  end
end

Make100.make_100
