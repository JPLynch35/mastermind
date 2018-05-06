require '~/turing/1module/projects/mastermind/lib/mastermind.rb'
require '~/turing/1module/projects/mastermind/lib/text.rb'

textblocks = Text.new
textblocks.welcome_text

loop do
  mainmenu = 1
  while mainmenu == 1
    user_select = gets.upcase.chomp
    if user_select == "P" || user_select == "PLAY"
      mainmenu = 0
      textblocks.difficulty_options
      difficulty_mode = gets.upcase.chomp
      newgame = Mastermind.new(difficulty_mode)
    elsif user_select == "I"|| user_select == "INSTRUCTIONS"
      textblocks.instructions
    elsif user_select == "Q" || user_select == "QUIT"
      exit
    else
      textblocks.not_valid_option
    end
  end


  textblocks.intro_play_text(newgame.number_of_spots)
  start = Time.now

  correct = 0
  number_of_guesses = 0

  while correct == 0
    user_guess_validated = 0
    while user_guess_validated == 0
      user_guess = gets.upcase.chomp
      newgame.check_user_guess_for_quit(user_guess)
      newgame.check_user_guess_for_cheat(user_guess, newgame.generated_code_array)
      if newgame.user_guess_cheat_detected == 0
        newgame.check_user_guess_for_length(user_guess, newgame.number_of_spots)
        newgame.check_user_guess_for_non_playable_characters(user_guess, newgame.number_of_spots)
        if newgame.user_guess_length_validated == 1 && newgame.user_guess_chars_validated == 1
          user_guess_validated = 1
        else
          user_guess_validated = 0
        end
      end
    end

    number_of_guesses += 1
    user_guess_array = user_guess.chars

    newgame.compare_for_colors(user_guess_array)
    newgame.compare_for_positions(user_guess_array)

    if newgame.correct_positions == newgame.number_of_spots
      correct = 1
    else
      textblocks.guess_hints(user_guess, newgame.correct_colors, newgame.correct_positions, number_of_guesses)
    end
  end

  finish = Time.now
  newgame.time_check(start, finish)
  textblocks.win(user_guess, number_of_guesses, newgame.finish_minutes, newgame.finish_seconds)

end
