data = [
  ['Frank', 33],
  ['Stacy', 15],
  ['Juan', 24],
  ['Dom', 32],
  ['Steve', 24],
  ['Jill', 24]
]

# Level 1: Write code that'll output the names (and only the names) in order by ascending age

# data.sort_by { |name,age| [age,name]}.each {|name| puts name[0] }

# Level 2: Output the name with the age, like Juan (24)
data.each {|name,age| puts [name,age].join(' ') }


# Level 3: If there are multiple people tied with the same age, put them in alphabetical order
# Sort names by the critera of "If names are equal, sort by name, else, sort by age"
data.sort { |(n1, a1), (n2, a2)| a1 == a2 ? n1 <=> n2 : a1 <=> a2 }


# Level 4: Write code to automatically build a hash with the age as the key and an array of names as the value (all the people who are that age). e.g. {24 => ['Juan', 'Steve', 'Jill']...}

data.sort { |(n1, a1), (n2, a2)| a1 == a2 ? n1 <=> n2 : a1 <=> a2 }.to_h


states = {"Oregon" => "OR",
          "Alabama" => "AL",
          "New Jersey" => "NJ",
          "Colorado" => "CO"}

capitals = {"OR" => "Salem",
            "AL" => "Montgomery",
            "NJ" => "Trenton",
            "CO" => "Denver"}
# Level 1: Write some code which given a state name ("Oregon") outputs its capital ("Salem")
puts "What state"
input  =  gets.chomp.capitalize.to_s
if states.include?(input)
	states[input]
	capitals[states[input]]
else
	"That capital is unknown"
end



# Level 2: Handle the case when a state's information is not known by returning "Unknown"
# Level 3: Now let's go the other way. Given a capital name ("Denver"), return the state name for which it is the capital ("Colorado")


# puts "What capital"
# input  =  gets.chomp.capitalize.to_s
# if capitals.invert.include?(input)
# 	capital = capitals.invert[input]
# 	states.invert[capital]
# else
# 	"That capital is unknown"
# end

scores = {
  "A"=>1, "B"=>3, "C"=>3, "D"=>2,
  "E"=>1, "F"=>4, "G"=>2, "H"=>4,
  "I"=>1, "J"=>8, "K"=>5, "L"=>1,
  "M"=>3, "N"=>1, "O"=>1, "P"=>3,
  "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
  "U"=>1, "V"=>4, "W"=>4, "X"=>8,
  "Y"=>4, "Z"=>10
}
# Level 1: Letter Scoring an Array

# Write code to output the score for the letters in an array like this:

# word = ['H', 'E', 'L', 'L', 'O']

# word.each { |letter| puts "#{letter} has the value #{scores[letter]}" }

# Which, when run, outputs this:

# H has the value 4
# E has the value 1
# L has the value 1
# L has the value 1
# O has the value 1




 word = "hello"

# word.each_char { |letter| puts "#{letter.upcase} has the value #{scores[letter.upcase]}"}
# # Which, when run, outputs this:

# H has the value 4
# E has the value 1
# L has the value 1
# L has the value 1
# O has the value 1

# Write code to output the total score for a string like this:

total = word.upcase.chars.map { |letter| scores[letter] }.reduce(:+)
puts "hello has the total score #{total}"

# Which, when run, outputs this:

# hello has the total score 8
