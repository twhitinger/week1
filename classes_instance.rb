

# class Refrigerator
#   attr_accessor :color, :contents, :temperature, :contents
#   def initialize(brand, color, temperature, plugged_in, contents)
#     @brand       = brand
#     @color       = color
#     @temperature = temperature
#     @plugged_in  = plugged_in
#     @contents    = contents
#   end
#
#   def temperature_in_celcius
#     (temperature - 32) * 5/9.0
#   end
#
#   def add_item(item)
#     contents << item
#   end
#
#   def greet(name)
#     "Hi #{name} nice to meet you!"
#   end
#
#
#
# end
#
# refrigerator_1  = Refrigerator.new("Maytag", "white", 36, true, ["leftover pizza", "yogurt", "soylent"])
# p "Number 1: #{refrigerator_1}"
#
# refrigerator_2   = Refrigerator.new("", "black", 40, true, [])
# p "Number 2: #{refrigerator_2}"
#
# refrigerator_3 = Refrigerator.new("", "black", 33, false, ["celery"])
# p "Number 3: #{refrigerator_3}"
#
# require 'pry'; binding.pry
# puts "-------"


  # class Person
  #
  # attr_reader :name, :year, :lang
  #
  #   def initialize(name, year, lang, alive)
  #     @name  = name
  #     @year  = year
  #     @lang  = lang
  #     @alive = alive
  #   end
  #
  #   def age
  #     current_year = Time.now.year
  #     current_year - year
  #   end
  # end
  #
  # bob = Person.new("bob", 1987, "En", true)
  # john = Person.new("john", 1988, "En", false)
  # tim = Person.new("tim", 1997, "En", true)
  #
  # require 'pry'; binding.pry
  # puts "-------"
