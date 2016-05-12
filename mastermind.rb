
def sequence(num, total)
(1..num).map { ["r","g","b","y","o","w"][rand(total)] }.join
end
s = sequence(4,4)
puts "Welcome to MASTERMIND"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
response = gets.chomp.downcase
# If they enter p or play then they enter the game flow described below.
# I have generated a beginner sequence with four elements made up of: (r)ed,
# (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
# What's your guess?
# They can then enter a guess in the form rrgb
if response == ("p" || "play")
  puts "I have generated a beginner sequence with four elements made up of:
(r)ed, (g)reen, (b)lue, and (y)ello. Use (q)uit at any time to end the game."
elsif response == ("i" || "instructions")
 puts "Enter some damn letters ---- rrrr rgby ggrb use your brain"
elsif response == ("q" || "quit")
  abort("She cannot take any more of this, Captain!")
elsif response == ("c" || "cheat")
  puts s
  abort("Fucking cheater")
elsif response == "restart"

end




  guess1 = nil
  guess = 0

until guess1 == s
  i = 0
  acc = []
  present = 0
  incorrect = 0

  puts "What is your guess?"
  guess1 = gets.chomp.downcase
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

  puts "There are #{acc.length} correct answers in the correct position."
  puts "#{present} answers that are present but in the wrong place, and #{incorrect} incorrect, this is guess # #{guess}"
end
