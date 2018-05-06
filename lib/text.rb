class Text

  def welcome_text
    puts "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "Mastermind is a game where the player tries to figure out the computer generated code sequence. The player starts off by providing an initial guess for each spot of the code.  The player can guess any combination of the colors available (repeats are allowed). If the player does not guess the code correctly on the first try, the game will provide hints on how many colors were correctly guessed overall, and how many colors were in the correct position. The game ends when the player correctly guesses the computer generated code sequence.\nBeginner mode has 4 spots of code and 4 colors (r)ed, (g)reen, (b)lue, and (y)ellow.  Intermediate mode has 6 spots of code and adds the color (o)range.  Advanced mode has 8 spots of code and adds the color (v)iolet.\nI hope you found that helpful.  Would you like to (p)lay or (q)uit?"
  end

  def difficulty_options
    puts "Please select your difficulty.
    (b)eginner mode- 4 spots, 4 colors (R, G, B, Y)
    (i)ntermediate mode- 6 spots, 5 colors (R, G, B, Y, O)
    (a)dvanced mode- 8 spots, 6 colors (R, G, B, Y, O, V)"
  end

  def intro_play_text(spots)
    if spots == 4
      puts "I have generated a beginner code with #{spots} spots made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
      What's your guess?"
    elsif spots == 6
      puts "I have generated an intermediate code with #{spots} spots made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (o)range. Use (q)uit at any time to end the game.
      What's your guess?"
    elsif spots == 8
      puts "I have generated an advanced code with #{spots} spots made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (o)range, and (v)iolet. Use (q)uit at any time to end the game.
      What's your guess?"
    end
  end

  def not_valid_option
    puts "Please select a valid option."
  end

  def secret_code(code)
    puts "Shhhhhh, don't tell anyone, but the secret code sequence is #{code.join("")}."
  end

  def guess_hints(user_guess, correct_colors, correct_positions, number_guesses)
    puts "'#{user_guess.upcase}' has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions.
    You've taken #{number_guesses} guesses."
  end

  def more_than_allowed(spots)
    puts "You entered too many characters.  Please enter #{spots}."
  end

  def less_than_allowed(spots)
    puts "You didn't enter enough characters.  Please enter #{spots}."
  end

  def check_your_user_input(spots)
    if spots == 4
      puts "Please check that your guess only includes (r)ed, (g)reen, (b)lue, and (y)ellow."
    elsif spots == 6
      puts "Please check that your guess only includes (r)ed, (g)reen, (b)lue, (y)ellow, and (o)range."
    elsif spots == 8
      puts "Please check that your guess only includes (r)ed, (g)reen, (b)lue, (y)ellow, (o)range, and (v)iolet."
    end
  end

  def win(user_guess, number_guesses, finish_m, finish_s)
    puts "Congratulations! You guessed the sequence '#{user_guess.upcase}' in #{number_guesses} guesses over #{finish_m} minutes and #{finish_s} seconds.
    Do you want to (p)lay again or (q)uit?"
  end

end
