class Mastermind
​
  def initialize(length = 4, colors = 4)
    @correct_answer = sequence(length, colors)
    @matching_letters = []
    @present = 0
    @incorrect = 0
    @counter = 0
    @start = Time.now
  end
​
  def sequence(num, total)
    (1..num).map { ["r","g","b","y","o","w"][rand(total)] }.join
  end
​
  def flow_control_begin
    response = gets.chomp.downcase
    if response == "p" || response == "play"
      puts "I have generated a beginner sequence with four elements made up of:
      (r)ed, (g)reen, (b)lue, and (y)ello. Use (q)uit at any time to end the game."
    elsif response == "i" || response == "instructions"
      puts "Enter some damn letters ---- rrrr rgby ggrb use your brain"
      mastermind
    elsif response == "q" || response == "quit"
      abort("She cannot take any more of this, Captain!")
    end
  end
​
  def mastermind
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    flow_control_begin
    guess = ""
    until guess == @correct_answer
      puts "What is your guess?"
      guess = gets.chomp.downcase
      check_for_abort(guess)
      while guess.length != 4
        puts "Too short yo" if guess.length < 4
        puts "Too long arr" if guess.length > 4
        guess = gets.chomp.downcase
      end
      game_logic(guess)
      puts @correct_answer
      @counter += 1

      computer_response(guess)
    end
  end
​
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
​
  def check_for_abort(guess)
    if guess == "c" || guess == "cheat"
      puts @correct_answer
      abort("Fucking cheater")
    elsif guess == "q" || guess ==  "quit"
      abort("She cannot take any more of this, Captain!")
    end
  end
​
  def game_logic(guess)
    i = 0; @matching_letters = []; @incorrect = 0
    guess.each_char do |x|
      if @correct_answer.chars[i] == x
        @matching_letters << x
      elsif guess.count(x) - @correct_answer.count(x) > 0
        @incorrect = (guess.count(x) - @correct_answer.count(x))
      end
      i += 1
    end
    @present = guess.length - @matching_letters.length - @incorrect
  end
​
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
​
end
​
new_game = Mastermind.new
new_game.mastermind
