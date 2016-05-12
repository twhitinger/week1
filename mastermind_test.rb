def sequence(num, total)
(1..num).map { ["r","g","b","y","o","w"][rand(total)] }.join
end

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
end
  puts "What is your guess? enter a guess in the form rgby."

  guess1 = gets.chomp.downcase

  s = sequence(4,4)
  present = 0
  correct = 0
  incorrect = 0
  guess = 0
  i = 0

guess1.each_char { |x|
if s.chars[i] == x
    correct += 1
elsif s.chars.include?(x)
    present += 1
else
    incorrect += 1
end
  i += 1

}
guess += 1

puts s
puts "There are #{correct} correct answers, #{present} present answers, #{incorrect - present} incorrect, this is guess # #{guess}"



# If they enter i or instructions they should be presented with a short explanation of how the game is played.
# If they enter q or quit then the game should exit
# Game Flow
#
# Once the user starts a game they should see:
#
#
#
# Guesses are case insensitive
# If it's 'q' or 'quit' then exit the game
# If it's 'c' or 'cheat' then print out the current secret code
# If it's fewer than four letters, tell them it's too short
# If it's longer than four letters, tell them it's too long
# If they guess the secret sequence, enter the end game flow below
# Otherwise give them feedback on the guess like this:
# 'RRGB' has 3 of the correct elements with 2 in the correct positions
# You've taken 1 guess
# Then let them guess again, repeating the game flow loop.
