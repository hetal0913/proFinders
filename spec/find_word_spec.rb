require "find_word"

describe FindWord do
    describe "return if given string is empty" do
      context "given an empty string" do
        it "returns zero" do
          find_words = FindWord.new("")
          words = find_words.seperate_string
          expect(words).to eq(0)
        end
      end
    end

    describe "return if given string is not empty" do
      context "given an string with multiple chracters" do
        it "returns words" do
          find_words = FindWord.new("abcd")
          words = find_words.seperate_string
          expect(words).not_to eq(0)
        end

        it "returns new computed string with valid noun, article, verb" do
          find_words = FindWord.new("abcd")
          find_words.seperate_string
          final = find_words.compute_string
          expect(final).to eq("abcd bcd bc c a")
        end
        
      end
    end  
end