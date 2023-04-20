class FindWord
    attr_accessor :final_string, :words

    def initialize(str="")
        @str = str
        @final_string = []
        @words = []
        @nouns = ["abcd", "c", "def", "h", "ij", "cde"]
        @verbs = [ "bc", "fg", "g", "hij", "bcd"]
        @articles = [ "a", "ac", "e"]
    end

    def seperate_string
        return if @str.empty?
        each_word = @str.split(" ")
        each_word.each do |string|
            length = string.length
            for n in length.downto(1) do
                get_words(n, string)
            end
        end
    end

    def get_words(n, string)
        i=0
        while i <= n-1 do
            @words << string.slice(i..n-1)
            i = i+1
        end
        @words.uniq.sort_by {|l| -l.length}
    end

    def compute_string
        @words.each do |word|
            @final_string << word unless @nouns.index(word).nil?
            @final_string << word unless @verbs.index(word).nil?
            @final_string << word unless @articles.index(word).nil?
        end
        @final_string
    end
end