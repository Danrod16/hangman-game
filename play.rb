class Hangman
  def initialize
    @letters = ('a'..'z')
    @word = words.sample
    @lives = 7
    @correct_guess = []
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += '_ '
    end
  end

  def words
    [
      ["taco", "Popular food in Mexico and a true source of inspirations for websites"],
      ["bear", "We love to cuddle them!"],
      ["Grimlins", "Be careful with that water! They can turn nasty"],
      ["Corona", "You wear it on the head but hide from it"],
      ["mountain", "Tall tall it grows but has no roots"],
    ]
  end

  def teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
    #replace blank values with letter that matches
      if letter == '_ ' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end
    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts 'Enter a letter'
      guess = gets.chomp

      #if letter is part of this word remove from letters array

      good_guess = @word.first.include? guess

      if good_guess
        puts 'You are correct!'
        @correct_guess << guess
        #remove correct guess from letters
        @letters.delete guess
        teaser guess
        make_guess
      else
        @lives -= 1
        puts "Sorry you have #{@lives} left ... try again"
        make_guess
      end
    else
      puts "game over"
    end
  end


  def begin
    # ask user for a letter
    puts "A new game has started.. you word is #{@word.first.size} characters long"
    teaser
    puts "Your clue is #{@word.last}"
    make_guess
  end

end

game = Hangman.new
game.begin
