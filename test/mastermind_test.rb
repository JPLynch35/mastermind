require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test

  def setup
    @tester = Mastermind.new("B")
  end

  def test_it_exists
    assert_instance_of Mastermind, @tester
  end

  def test_attributes
    assert_equal 4, @tester.number_of_spots
    assert_equal 4, @tester.number_of_colors
    assert_equal 4, @tester.generated_code_array.count
  end

  def test_check_user_guess_for_cheat
    @tester.check_user_guess_for_cheat("C", ["B", "B", "B", "B"])
    assert_equal 1, @tester.user_guess_cheat_detected
  end

  def test_check_user_guess_for_length
    @tester.check_user_guess_for_length("GBBB", 4)
    assert_equal 1, @tester.user_guess_length_validated
  end

  def test_check_user_guess_for_non_playable_characters
    @tester.check_user_guess_for_non_playable_characters("GBBT", 4)
    assert_equal 0, @tester.user_guess_chars_validated
  end

  def test_time_check
    start = 5
    finish = 165
    time = @tester.time_check(start, finish)
    assert_equal 2, @tester.finish_minutes
    assert_equal 40, @tester.finish_seconds
  end

end
