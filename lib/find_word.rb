class FindWord
    attr_accessor :final_string, :words

    # Initialize the default variables to be used
    def initialize(str="")
        @str = str
        @final_string = []
        @words = []
        @nouns = ["abcd", "c", "def", "h", "ij", "cde"]
        @verbs = [ "bc", "fg", "g", "hij", "bcd"]
        @articles = [ "a", "ac", "e"]
    end

    # Seperate the given string and generate the possible words from the given string
    def seperate_string
        return 0 if @str.empty?
        each_word = @str.split(" ")
        each_word.each do |string|
            length = string.length
            for n in length.downto(1) do
                get_words(n, string)
            end
        end
    end

    # Generate possible number of words from the given word
    def get_words(n, string)
        i=0
        while i <= n-1 do
            @words << string.slice(i..n-1)
            i = i+1
        end
        @words.uniq.sort_by {|l| -l.length}
    end

    # Compute the generated words and create new Annkissam string based on the words
    def compute_string
        @words.each do |word|
            @final_string << word unless @nouns.index(word).nil?
            @final_string << word unless @verbs.index(word).nil?
            @final_string << word unless @articles.index(word).nil?
        end
        puts @final_string.join (" ")
        @final_string.join (" ")
    end
end