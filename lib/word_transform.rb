# Write a program that takes a list of words (for example /usr/share/dict/words on a
# unix system or download the file from :  https://github.com/dwyl/english-
# words/blob/master/words.txt  if you are using windows) and then reads pairs of words
# on stdin and prints YES  if the words are connected by a chain, and NO& if they are not.
# If YES, the words in the word chain should be listed out on the console. The
# program should take the path to the word list from a file, and should then loop,
# reading pairs of whitespace-delimited words from the file and printing YES  or NO.
# Classes:
#     Equilibrium - Word Chain Solver.
# Usage:
#  ruby word_transform.rb dog cat
#returns true/false

class WordTransform
    def initialize
    end
    
    def transform(english_words, start, stop)
        return "NO" if start.length!=stop.length
        queue = []
        visited =[]
        queue<<start
        visited<<start
        while(!queue.empty?)
            print "."
            word = queue.shift
            result_words = transform_letters(word,english_words)
            for result_word in result_words
                if(!visited.include?(result_word))
                    visited<<result_word
                    if(result_word==stop)
                        p visited
                        return "YES" 
                    end
                    queue<<result_word
                    queue.uniq
                end
            end
        end
        return "NO"
    end

    def transform_letters(word,english_words)
        result = []
        for i in 0..word.length-1
            temp_word = word.dup
            for ch in 'a'..'z'
                if(temp_word[i]!=ch)
                    temp_word[i] = ch
                    if english_words.include?(temp_word)
                        result.push temp_word.dup
                    end
                end
            end
        end
        return result.uniq
    end
end

word_transform = WordTransform.new
start = ARGV[0].strip.downcase
stop = ARGV[1].strip.downcase
english_words = []
 File.open("words.txt", "r") do |f|
    f.each_line do |line|
        english_words << line.strip.downcase
    end
end
print "\n\nStarted Processing\n"
print word_transform.transform(english_words, start, stop)
print "\n"
 