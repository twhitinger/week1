goodbye = 0
puts "HEY KID!"
while goodbye < 2

  input = gets.chomp

  if input == "GOODBYE!" && (goodbye < 1)
    goodbye += 1
    puts "LEAVING SO SOON?"
  elsif input == "GOODBYE!" && (goodbye == 1)
    goodbye += 1
    puts "LATER, SKATER!"
  elsif input == ""
    puts "WHAT?!"
  elsif input == input.upcase
    puts "NO, NOT SINCE 1946"
  else
    speak = 0
    input.each_char { |x| if (x == x.downcase) && !(speak > 0); puts "SPEAK UP, KID!"; speak += 1; end}
  end

end
