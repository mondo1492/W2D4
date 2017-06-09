require 'byebug'

def first_anagram(str1, str2)
  perms = str1.chars.permutation.to_a
  perms.each do |perm|
    return true if  perm.join("") == str2
  end
  false
end

def second_anagram(str1, str2) #o(n^2)
  char_word1 = str1.chars
  char_word2 = str2.chars
  str1.length.times do |i1|
    str2.length.times do |i2|
      if str1[i1] == str2[i2]
        char_word1[i1] = ""
        char_word2[i2] = ""
      end
    end
  end

  char_word1.join("").empty? && char_word2.join("").empty? ? true : false
  # return false if str1.length != str2.length
  # str1.chars.each do |let1|
  #   includes_letter = false
  #   str2.chars.each do |let2|
  #     includes_letter = true if let1 == let2
  #     next if includes_letter
  #     return false
  #
  #   end
  # end

end

def third_anagrams(str1, str2) #O(n^4)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagrams(str1, str2)
  hash1 = Hash.new(0)
  p hash1.object_id
  hash2 = Hash.new(0)
  p hash2.object_id
  str1.chars.each do |e|
    hash1[e] += 1
  end
  str2.chars.each do |e|
    hash2[e] += 1
  end
  # hash1 == hash2
  hash1.each do |k, v|
    return false if hash2[k] != v && hash1.length == hash2.length
  end
  true
end
