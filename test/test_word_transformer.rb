require './lib/word_transform'
require 'test/unit'

class TestWordTransformer < Test::Unit::TestCase
  def test_valid_data
    word_transform = WordTransform.new
    english_words = []
    File.open("words.txt", "r") do |f|
      f.each_line do |line|
        english_words << line.strip.downcase
      end
    end
    res = word_transform.transform(english_words, "dump", "like")
    assert(res=="YES")

    res = word_transform.transform(english_words, "dump", "came")
    assert(res=="YES")
  end

  def test_invalid_data
   english_words = []
    word_transform = WordTransform.new
    File.open("words.txt", "r") do |f|
      f.each_line do |line|
        english_words << line.strip.downcase
      end
    end
    res = word_transform.transform(english_words, "dumps", "like")
    assert(res=="NO")
  end
end