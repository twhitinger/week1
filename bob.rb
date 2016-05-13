class Bob

  def hey(remark)

    if remark == remark.upcase  && remark.split('').find {|x| ('a'..'z').to_a.include?(x) ||
      ('A'..'Z').to_a.include?(x) } != nil
      "Whoa, chill out!"
    elsif remark[-1] == "?"
      'Sure.'
    elsif remark.strip == ""
      'Fine. Be that way!'
    else
      "Whatever."
    end



    # He says 'Fine. Be that way!' if you address him without actually saying anything.
    #
    # He answers 'Whatever.' to anything else.

  end

end
