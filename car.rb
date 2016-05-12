  class Car
    attr_accessor :color, :wheel_count, :turnt
    def initialize(turnt)
        @turnt = turnt
    end
    def horn
      "BEEEEEP!"
    end

    def drive(distance)
      "I'm driving #{distance} miles"
    end

    def report_color
      "I'am #{color}"
    end

    def start


    end

  end

my_car = Car.new
my_car.color = 'purple'
my_car.wheel_count = 18
puts "This sweet ride is sitting on #{wheel_count} wheels"

my_second_car = Car.new
my_second_car.wheel_count = 2
puts "This sweet ride is sitting on #{wheel_count} wheels"

require 'pry'; binding.pry
puts "-------"





# This one is tricky. Add a method named start.
If the car has not yet been started, when the method is called it should
return "Starting up!". But if the car has previously been started, it
should return "BZZT! Nice try, though.". You'll need to
create an instance variable, a method, use an if statement, and return a value.
# Be
