class Hanging
  def initialize
    @word = words.sample
    @lives = 7
    @word_teaser = ""
    @word.first.size.times do
      @word_teaser += "_ "
    end
  end

  def words
    [
      ["pizza", "The best food ever"],
      ["princess", "From royal family, but not a queen "],
      ["mother", "She gave you life"],
      ["preparation", "When you are getting ready for smth"],
      ["acceleration", "Rate at which velocity changes with time"],
    ]
  end

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split
    new_teaser.each_with_index do |letter, index|
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end
    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp
      good_guess = @word.first.include? guess
      if guess == "exit"
        puts "Thank you for playing!"
      elsif guess.length > 1
        puts "only guess 1 letter at a time please!"
        make_guess
      elsif good_guess
        puts "You are correct!"
        print_teaser guess
        if @word.first == @word_teaser.split.join
          puts "YEES you win"
        else
          make_guess
        end
      else
        @lives -= 1
        puts "Sorry... you have #{ @lives } lives left. Try again!"
        make_guess
      end
    else
      puts "You lost,sorry"
    end
  end

def begin
    puts "New game started... your word is #{ @word.first.size } characters long"
    puts "To exit game at any point type 'exit'"
    print_teaser
    puts "Clue: #{ @word.last }"
    make_guess
  end
end

game = Hanging.new
game.begin