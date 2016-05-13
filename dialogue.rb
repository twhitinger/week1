module Dialogue
def Dialogue.instruct
"Enter p or play and choose your difficulty level. When prompted enter your guess
based on the generated sequence you select during level selection.
Enter 4 characters for beginner (ie. rrrr) matching the first letter of the color
you want to guess, 6 characters for intermediate, 8 characters for advanced.
The colors will be displayed after selecting difficulty."
end

def Dialogue.intermediate_words
"I have generated an intermediate sequence with six elements made up of: (r)ed,
(g)reen, (b)lue, (y)ellow and (o)range. Enter six characters as your guess (ie. rgbyor).
Use (q)uit at any time to end the game."
end

def Dialogue.advanced_words
"I have generated an advanced sequence with eight elements made up of: (r)ed,
(g)reen, (b)lue, (y)ellow, (o)range and (w)hite. Enter eight characters as your
guess (ie. rgbyowr). Use (q)uit at any time to end the game."
end

def Dialogue.beginner_words
"I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
end

end
