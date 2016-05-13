class Mastermind

  def initialize(length = 4, colors = 4)
    @correct_answer = sequence(length, colors)
    @matching_letters = []
    @present = 0
    @incorrect = 0
    @counter = 0
    @start = Time.now
  end

  def sequence(num, total)
    (1..num).map { ["r","g","b","y","o","w"][rand(total)] }.join
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
      puts "Enter p or play and choose your difficulty level. When prompted enter your guess
based on the generated sequence you select during level selection.
Enter 4 characters for beginner (ie. rrrr) matching the first letter of the color you want to guess, 6 characters for intermediate, 8 characters for advanced.
The colors will be displayed after selecting difficulty."
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
      puts "I have generated an intermediate sequence with six elements made up of: (r)ed,
(g)reen, (b)lue, (y)ellow and (o)range. Enter six characters as your guess (ie. rgbyor).
Use (q)uit at any time to end the game."
    elsif difficulty == "a" || difficulty == "advanced"
      @correct_answer = sequence(8,6)
      puts "I have generated an advanced sequence with eight elements made up of: (r)ed,
(g)reen, (b)lue, (y)ellow, (o)range and (w)hite. Enter eight characters as your guess (ie. rgbyowr).
Use (q)uit at any time to end the game."
    elsif difficulty == "b" || difficulty == "beginner"
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
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
      puts "There are #{@matching_letters.length} correct answers in the correct position."
      puts "#{@present} answers that are present but in the wrong place, and #{@incorrect} incorrect, this is guess # #{@counter}"
    else
      finish = Time.now
      puts "Congratulations! You guessed the sequence #{@correct_answer} in #{@counter} guesses over a duration of #{Time.at(finish - @start).utc.strftime("%M:%S") }."
      replay_game?
    end
  end

end

new_game = Mastermind.new
new_game.mastermind
