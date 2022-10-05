class Hanging
  def initialize
    @word = "incomprehensibility"
  end

  def hide_word
    @user_word = @word.gsub(/\w/, "_")
    puts @user_word
  end

  def guess_word
    puts "Guess a letter"
    @guess = gets.chomp
  end

  def check_if_matches
    index = 0
    @word.each_char do |letter|
      if letter == @guess
        @user_word[index] = letter
      end
      index += 1
    end
    puts @user_word
  end

  def play_game
    hide_word
    while @user_word != @word
      guess_word
      check_if_matches
    end
  end
end

game = Hangman.new
game.play_game
@word = "incomprehensibility"
puts" Congratulations!! You won this game, the hidden word is #{@word}"