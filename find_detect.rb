def find_first_even
  array = [1,2,3,4,5]
  array.each { |num| return num if num.even? }
end

def find_first
  array.find { |num| num.even? }
end

def find_long
  array = ["dog", "caterpiller", "bee"]
  array.find { |word| word.length > 3 }
end

def find_all_odds
  array = [1,2,3,4,5]
  array.find_all { |num| num.odd? }
end

def named_t
  array = ["Taylor", "Fred", "Bob", "terry", "Jeff"]

  array.select {|name| name.upcase[0] == "T"}
end
