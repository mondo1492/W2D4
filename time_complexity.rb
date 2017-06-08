require 'byebug'
def my_min_1(arr) #O(n^2)
  min_num = arr[0]
  (1..(arr.length - 2)).each do |i|
    (i + 1..(arr.length - 1)).each do |j|
      if arr[i] < min_num
        min_num = arr[i]
      elsif arr[j] < min_num
        min_num = arr[j]
      end
    end
  end
  min_num
end

def my_min_2(arr) #O(n)
  min_num = arr[0]
  (1..(arr.length - 2)).each do |i|
    min_num = arr[i] if arr[i] < min_num
  end
  min_num
end

def contiguous_sub_sum(list) #[1,3,4]
  posible_subs_sums = []
  list.each_with_index do |el, idx|
    subarr = []
    subarr += [el]
    posible_subs_sums << subarr
    list[idx + 1..-1].each do |el2|
      subarr += [el2]
      posible_subs_sums << subarr
    end
  end
  max_sum = posible_subs_sums[0].reduce(:+)
  posible_subs_sums.each do |subs_sum|
    result = subs_sum.reduce(:+)
    max_sum = result if result > max_sum
  end
  max_sum
end

def contiguous_sub_sum2(list) #[-5,-1,-3]
  sum_subs = list[0] #-5 , -1
  i, j = 0, 0 #
  until i > list.length - 1 #
    # sum_subs = list[i] if j == 0
    # j += 1
    if i == 0 
      sum_subs = list[0]
    elsif sum_subs < sum_subs + list[i + j] && sum_subs >= 0
      sum_subs += list[i + j]
    elsif sum_subs < list[i + j]
      sum_subs = list[i + j]
    end
    if i + j == list.length - 1
      i += 1
      j = 0
    else
      j += 1
    end
  end
  sum_subs
end
