# 1831. Given a sorted array, find the smallest positive integer that is not the sum of a subset of the array. 
# For example, for the input [1, 2, 3, 10], you should return 7.
# Do this in O(N) time.

def smallest_missing(nums)
    smallest_missing = 1
    nums.each do |num|
        return smallest_missing if smallest_missing < num 
        smallest_missing += num 
    end
    smallest_missing
end

puts smallest_missing([1, 2, 3, 10])

module Abc 
    class << self 
    end
end 