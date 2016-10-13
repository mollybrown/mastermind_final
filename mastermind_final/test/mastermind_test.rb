require 'minitest/autorun'
require 'minitest/pride'
require './mastermind_game'

class MastermindTest < Minitest::Test
  
  def test_inital_color_values_exist_at_start
  	game = Game.new
  	assert_equal ["r","g","b","y"], @colors
  end

  def test_secret_code_array_is_empty_at_start
  	game = Game.new
  	assert_equal [], @secret_code
  end

  def test_correct_color_count_is_zero_at_start
  	game = Game.new
  	assert_equal 0, @correct_colors
  end

  def test_correct_position_count_is_zero_at_start
  	game = Game.new
  	assert_equal 0, @correct_positions
  end

  def test_number_guesses_is_zero_at_start
  	game = Game.new
  	assert_equal 0, @guesses
  end

end
