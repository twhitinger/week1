wrap_up = Time.new(2016, 5, 11, 16, 05)
=> 2016-05-11 16:05:00 -0600

# use wrap_up variable and a formatter to produce this:
=> "2016-05-13"
wrap_up.strftime("%Y-%m-%d")


# use wrap_up variable and a formatter to produce this:
=> "05/13/16"

wrap_up.strftime("%m/%d/%y")

# use wrap_up variable and a formatter to produce this:
=> "16:05 MDT" # (24-hour time with time zone)
wrap_up.strftime("%H:%M %Z")
# use wrap_up variable and a formatter to produce this:
=> "4:05 pm"
wrap_up.strftime("%H:%M %p")

# use wrap_up variable and a formatter to produce this:
=> "05/13/16 5:10 pm"

wrap_up.strftime("%m/%d/%y %H:%M %p")
