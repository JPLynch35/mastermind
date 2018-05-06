require './lib/text'

class Mastermind

  attr_reader :generated_code_array, :correct_colors, :correct_positions, :number_of_spots, :number_of_colors, :finish_minutes, :finish_seconds, :user_guess_cheat_detected, :user_guess_length_validated, :user_guess_chars_validated

  def initialize(difficulty_mode)
    @generated_code_array = []
    correct_choice = 0
    while correct_choice == 0
      if difficulty_mode == "B"
        @number_of_spots = 4
        @number_of_colors = 4
        correct_choice = 1
      elsif difficulty_mode == "I"
        @number_of_spots = 6
        @number_of_colors = 5
        correct_choice = 1
      elsif difficulty_mode == "A"
        @number_of_spots = 8
        @number_of_colors = 6
        correct_choice = 1
      else
        textblocks_2 = Text.new
        textblocks_2.not_valid_option
        difficulty_mode = gets.upcase.chomp
      end
    end
    @number_of_spots.times do
      if @number_of_colors == 4
        pick = ["R", "G", "B", "Y"].sample
        @generated_code_array << pick
      elsif @number_of_colors == 5
        pick = ["R", "G", "B", "Y", "O"].sample
        @generated_code_array << pick
      elsif @number_of_colors == 6
        pick = ["R", "G", "B", "Y", "O", "V"].sample
        @generated_code_array << pick
      end
    end
  end

  def check_user_guess_for_quit(user_guess)
    if user_guess == "Q" || user_guess == "QUIT"
      exit
    end
  end

  def check_user_guess_for_cheat(user_guess, generated_code)
    textblocks_3 = Text.new
    if user_guess == "C" || user_guess == "CHEAT"
      textblocks_3.secret_code(generated_code)
      @user_guess_cheat_detected = 1
    else
      @user_guess_cheat_detected = 0
    end
  end

  def check_user_guess_for_length(user_guess, spots)
    textblocks_4 = Text.new
    if user_guess.chars.count > spots
      textblocks_4.more_than_allowed(spots)
      @user_guess_length_validated = 0
    elsif user_guess.chars.count < spots
      textblocks_4.less_than_allowed(spots)
      @user_guess_length_validated = 0
    else
      @user_guess_length_validated = 1
    end
  end

  def check_user_guess_for_non_playable_characters(user_guess, spots)
    textblocks_5 = Text.new
    if spots == 4
      if user_guess.delete('RGBY') != ""
        textblocks_5.check_your_user_input(spots)
        @user_guess_chars_validated = 0
      else
        @user_guess_chars_validated = 1
      end
    elsif spots == 6
      if user_guess.delete('RGBYO') != ""
        textblocks_5.check_your_user_input(spots)
        @user_guess_chars_validated = 0
      else
        @user_guess_chars_validated = 1
      end
    elsif spots == 8
      if user_guess.delete('RGBYOV') != ""
        textblocks_5.check_your_user_input(spots)
        @user_guess_chars_validated = 0
      else
        @user_guess_chars_validated = 1
      end
    end
  end

  def compare_for_colors(user_guess_array)
    @correct_colors = 0
    cloned_generated_code = @generated_code_array.clone
    user_guess_array.each do |guess|
      cloned_generated_code.each_with_index do |generated_iteration, index|
        if guess == generated_iteration
          cloned_generated_code[index] = "n"
          @correct_colors += 1
          break
        end
      end
    end
  end

  def compare_for_positions(user_guess_array)
    @correct_positions = 0
    @number_of_spots.times do |x|
      if user_guess_array.at(x-1) == @generated_code_array.at(x-1)
        @correct_positions += 1
      end
    end
  end

  def time_check(start, finish)
    timetocomplete = finish - start
    @finish_minutes = (timetocomplete / 60).to_i
    @finish_seconds = (timetocomplete % 60).to_i
  end

end
