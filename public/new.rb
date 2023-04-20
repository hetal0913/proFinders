# - Nouns: "abcd", "c", "def", "h", "ij", "cde"
# - Verbs: "bc", "fg", "g", "hij", "bcd"
# - Articles: "a", "ac", "e"

# Input = "abcd", should return the following list:
# [abcd a bc bcd c] or [abcd a bcd bc c]

# Input = "hij", should return the following list:
# [h hij ij]

# Input = "hijhij", should return the following list:
# [h hij ij h hij ij]


# Input = "gc", should return the following list:
# [g c]

# Input = "dbd", should return the following list:
# []


@str = "gc"
@nouns = ["abcd", "c", "def", "h", "ij", "cde"]
@verbs = [ "bc", "fg", "g", "hij", "bcd"]
@articles = [ "a", "ac", "e"]
@words = []
@final = []
def get_words(n, string)
    i=0
    while i <= n-1 do
        # puts "::::#{i}:::::string.slice(i..n) = #{string.slice(i..n-1)}"
        @words << string.slice(i..n-1)
        i = i+1
    end
    @words.uniq
end

def compute_string
    puts ":::::::words = #{@words}"

    @words.each do |word|
        puts ":::word = #{word}"
        @final << word unless @nouns.index(word).nil?
        @final << word unless @verbs.index(word).nil?
        @final << word unless @articles.index(word).nil?
    end

    @final.sort
end

def seperate_string
    return if @str.empty?
end

each_word = @str.split(" ")
    each_word.each do |string|
        puts "::::::#{string.length}"
        length = string.length
        for n in length.downto(1) do
            # puts ":::::n time = #{n}:::;#{string}"
            get_words(n, string)
        end
    end

d = compute_string
puts ":::::final = #{d}"

def find_max(arr)
    h = Hash.new(0)
    arr.each do |val|
        h[val] = h[val]+1
        return val if h[val] == 3
    end
end

def paired?(s)
    stack = []
    brackets = { '{' => '}', '[' => ']', '(' => ')' }

    s.each_char do |char|
      puts "::: stack = #{stack}"
      if brackets.key?(char)
        puts ":::::push:#{char}"
        stack.push(char)
      elsif brackets.values.include?(char)
        puts ":::::brackets.key(char):#{brackets.key(char)}"
        po = stack.pop
        puts ":pop = #{po}"
        return false if brackets.key(char) != po
      end
    end
    stack.empty?
end


# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n, k)
    # Implement your solution here
    final_no = []
    n.to_s.split("").each do |val|
      if k > 0
        val = val.to_i
        value_to_add = 9-val
        add_value = (value_to_add > k)? k : value_to_add
        final_no << val + add_value
        k = k - add_value
      else
        final_no << val
      end
    end
    final_no.join.to_i
end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :title, inclusion: { in: %w(Mrs Ms Mr) }
  validates :age, numericality: { greater_than: 0 }, allow_nil: true
  validates :phone_number, format: { with: /\A\+[1]\d{10}\z/, message: "Sorry, only US phone numbers are allowed" }
  validates :password, length: { minimum:6, maximum:20 }
  validates :password, confirmation: true, unless: -> { password.blank? }


  
arr = [[1,2,3, 4],[4, [5]]]

new_arr = []
arr.each do |element|
    if element.class == Array
      puts "::::::e = #{element[0]}"
      new_arr = new_arr.push(element[0]) if new_arr.empty?
      element.each do |eval|
        new_arr.each do |val|
          unless eval == val
            new_arr = new_arr.push(eval)
          end
          break
        end
      end
    else
      puts "::else::::#{element}"
      new_arr = new_arr.push(element)
    end
end

puts "final = #{new_arr}"