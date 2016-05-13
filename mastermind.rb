class Mastermind
  require './dialogue.rb'

  def initialize(length = 4, colors = 4)
    @correct_answer = sequence(length, colors)
    @matching_letters = []
    @present = 0
    @incorrect = 0
    @counter = 0
    @start = Time.now
  end

  def mastermind
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    flow_control_begin
    game_instance
  end

  def game_instance
    guess = ""
    until guess == @correct_answer
      puts "What is your guess? Enter (q)uit, or (c)heat to exit"
      guess = gets.chomp.downcase
      guess_validator(guess)
      game_logic(guess)
      puts @correct_answer
      @counter += 1
      computer_response(guess)
    end
  end

  def sequence(num, total)
    (1..num).map { ["r","g","b","y","o","w"][rand(total)] }.join
  end

  def game_logic(guess)
    i = 0; @matching_letters = []; @incorrect = 0
    guess.each_char do |x|
      if @correct_answer.chars[i] == x
        @matching_letters << x
      elsif guess.count(x) - @correct_answer.count(x) > 0
        @incorrect = (guess.count(x) - @correct_answer.count(x) )
      end
      i += 1
    end
    @present = @correct_answer.length - @matching_letters.length - @incorrect
  end

  def flow_control_begin
    input = gets.chomp.downcase
    if input == "p" || input == "play"
      game_difficulty
    elsif input == "i" || input == "instructions"
      puts Dialogue.instruct
      mastermind
    elsif input == "q" || input == "quit"
      abort("She cannot take any more of this, Captain!")
    end
  end

  def game_difficulty
    puts "What difficulty level? (b)eginner, (i)ntermediate, (a)dvanced?"
    difficulty = gets.chomp.downcase
    if difficulty == "i" || difficulty == "intermediate"
      @correct_answer = sequence(6,5)
      puts Dialogue.intermediate_words
    elsif difficulty == "a" || difficulty == "advanced"
      @correct_answer = sequence(8,6)
      puts Dialogue.advanced_words
    elsif difficulty == "b" || difficulty == "beginner"
      puts Dialogue.beginner_words
    else
      puts "enter the difficulty in the correct format"
      game_difficulty
    end
  end

  def guess_validator(guess)
    while guess.length != @correct_answer.length
      check_for_abort(guess)
      puts "Too short yo" if guess.length < @correct_answer.length
      puts "Too long arr" if guess.length > @correct_answer.length
      guess = gets.chomp.downcase
    end
  end

  def replay_game?
    puts "Do you want to (p)lay again or (q)uit?"
    response = gets.chomp.downcase
    if response == "p" || response == "play"
      play_again = Mastermind.new
      play_again.mastermind
    elsif response == "q" || response == "quit"
      abort("She cannot take any more of this, Captain!")
    end
  end

  def check_for_abort(guess)
    if guess == "c" || guess == "cheat"
      puts @correct_answer
      abort("cheating is a bad habit")
    elsif guess == "q" || guess ==  "quit"
      abort("She cannot take any more of this, Captain!")
    end
  end

  def computer_response(guess)
    if guess != @correct_answer
      puts "There are #{@matching_letters.length} correct answers in the correct position.
#{@present} answers that are present but in the wrong place, and #{@incorrect} incorrect,
this is guess # #{@counter}"
    else
      finish = Time.now
      puts "Congratulations! You guessed the sequence #{@correct_answer} in #{@counter}
guesses over a duration of #{Time.at(finish - @start).utc.strftime("%M minutes %S seconds") }."
      replay_game?
    end
  end

end

new_game = Mastermind.new
new_game.mastermind
