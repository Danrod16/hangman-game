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

  def begin
    # ask user for a letter
    puts "A new game has started"
    puts "Your clue is #{@word.last}"
    puts "Enter a letter"
    guess = gets.chomp

  end
end

game = Hangman.new
game.begin

