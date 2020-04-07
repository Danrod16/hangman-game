class Hangman
  def initialize
    @letters = ('a'..'z')
    @word = words.sample
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

  def make_guess
    puts 'Enter a letter'
    guess = gets.chomp

    #if letter is part of this word remove from letters array

    good_guess = @word.first.include? guess

    if good_guess
      puts 'good guess!'
    else
      puts 'try again'
    end
  end

  def begin
    # ask user for a letter
    puts "A new game has started.. you word is #{@word.first.size} characters long"
    teaser
    puts "Your clue is #{@word.last}"
    make_guess
  end

  def teaser
    word_teaser = ''
    @word.first.size.times do
      word_teaser += '_ '
    end
    puts word_teaser
  end
end

game = Hangman.new
game.begin

