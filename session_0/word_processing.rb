# The function `lower_case` takes an array of strings and converts
# any non-lower case alphabet (A..Z) to corresponding lower case
# alphabet
def lower_case(words)
  return words.map {|word| word.downcase}
end

# Similar to `lower_case`, this function modifies the array in-place
# and does not return any value.
def lower_case!(words)
  words.map! { |e| e.downcase  }
end

# Given a prefix and an array of words, return an array containing
# words that have same prefix.
#
# For example:
# words_with_prefix('apple', ['apple', 'ball', 'applesauce']) would
# return the words 'apple' and 'applesauce'.
def words_with_prefix(prefix, words)
  final = words.select {|word| word.start_with?(prefix)}
  return final
end

# The similarity score between two words is defined as the length of
# largest common prefix between the words.
#
# For example:
# - Similarity of (bike, bite) is 2 as 'bi' is the largest common prefix.
# - Similarity of (apple, bite) is 0 as there are no common letters in
#   the prefix
# - similarity of (applesauce, apple) is 5 as 'apple' is the largest
#   common prefix.
#
# The function `similarity_score` takes two words and returns the
# similarity score (an integer).
def similarity_score(word_1, word_2)
  len1 = word_1.length
  len2 = word_2.length
  len = 0
  if (len1 > len2)
    len = len2
  else
    len = len1
  end
  score = 0
  (0..len-1).each do |i|
    if (word_1[i] == word_2[i])
      score = score + 1
    else
      break
    end
  end
  return score
end

# Given a chosen word and an array of words, return an array of word(s)
# with the maximum similarity score in the order they appear.
def most_similar_words(chosen_word, words)
  max_score = 0
  answer = []
  words.each do |word|
    score = similarity_score(chosen_word, word)
    if (score > max_score)
      max_score = score
      answer = []
      answer << word
    elsif (score == max_score)
      answer << word
    end
  end
  return answer  
end
