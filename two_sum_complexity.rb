# def two_sum_sorting(arr,target)
#   sorted_arr = arr.sort
#   midle_idx = arr.length / 2
#   midle_val = arr[midle_idx]
#   left = arr.take(midle_idx)
#   left_sum = left[-1] + left[-2]
#   right = arr.drop(midle_idx)
#
# end

def hash_two_sum(arr, target)
  hash = Hash.new
  arr.each do |e|
    hash[e] = true
  end
  hash.keys do |k|
    return true if hash[target - k.to_i ] == true
  end
  false

end
