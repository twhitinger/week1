def sequence(num, total)

  (1..num).map { ["r","g","b","y","o","w"][rand(total)] }.join

end



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



def mastermind
  puts "Welcome to MASTERMIND"
  puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    flow_control_begin
    s = sequence(4,4); guess = 0; guess1 = ""
     start = Time.now
     until guess1 == s
       i = 0; acc = []; present = 0; incorrect = 0
       puts "What is your guess?"
       guess1 = gets.chomp.downcase
         if guess1 == "c" || guess1 == "cheat"
           puts s
           abort("Fucking cheater")
         elsif guess1 == "q" || guess1 ==  "quit"
           abort("She cannot take any more of this, Captain!")
         end
      while guess1.length != 4
         puts "Too short yo" if guess1.length < 4
         puts "Too long arr" if guess1.length > 4
         guess1 = gets.chomp.downcase
      end
       guess1.each_char { |x|
          if s.chars[i] == x
            acc << x
          elsif guess1.count(x) - s.count(x) > 0
            incorrect = (guess1.count(x) - s.count(x))
          end
        i += 1
      }
      present = guess1.length - acc.length - incorrect

    puts s
    guess += 1
    puts guess

    if guess1 != s
    puts "There are #{acc.length} correct answers in the correct position."
    puts "#{present} answers that are present but in the wrong place, and #{incorrect} incorrect, this is guess # #{guess}"
    end
  end
    finish = Time.now
    puts "Congratulations! You guessed the sequence #{s} in #{guess} guesses over a duration of #{Time.at(finish - start).utc.strftime("%M:%S") }."

  puts "Do you want to (p)lay again or (q)uit?"
  response = gets.chomp.downcase
    if response == "p" || response == "play"
      mastermind
    elsif response == "q" || response == "quit"
      abort("She cannot take any more of this, Captain!")
    end
end

mastermind
