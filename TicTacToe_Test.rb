require 'minitest/autorun'
require_relative 'TicTacToe'

class TicTaoToe_Test < MiniTest::Unit::TestCase
	# Test to create the instance object to class TicTacToe
	def setup
		@tictac = TicTacToe.new
	end
	
	# Test to check that the board is initialized 
	def test_board_isintialized
		@tictac.initialize_board
		assert_equal "1", $board_position[0]
		assert_equal "9", $board_position[8]
		assert_equal 9, $board_position.length
	end

	# Test to check the first and second player name 
	def test_get_multi_player
		$first_player = "Aakriti"
		$second_player = ""
		# running 1 invalid test case for player names 
		is_valid = @tictac.check_valid_player($first_player, $second_player)
		assert_equal "Bad Choice ! Name Fields cannot be Empty", $error
		assert_equal 0, is_valid

		$second_player = "Aakriti"
		# running 2 invalid test case for player names 
		is_valid = @tictac.check_valid_player($first_player, $second_player)
		assert_equal "Bad Choice ! Names cannot be same" , $error
		assert_equal 0, is_valid

		$second_player = "Dushan"
		# running valid test case for player names 
		is_valid = @tictac.check_valid_player($first_player, $second_player)
		assert_equal "" , $error
		assert_equal 1, is_valid
		assert_equal "Dushan", $second_player
		assert_equal "Aakriti", $first_player
	end

	# Test status of current board
	def test_current_board_status
				@tictac = TicTacToe.new
	  		$first_player = "Aakriti"
	  		$second_player = "Dushan"
	      @tictac.welcome_message
	      @tictac.initialize_board
	      choice = 1
	      $board_position[choice] = "X"
	      # check invalid board id
	      is_available = @tictac.check_position_status(choice)
	      # checking dynamic generated error msg
	      assert_equal "#{(choice + 1)} " + "is already filled, Please choose a another position !!", $error
	      assert_equal 0, is_available
	      # check valid board id 
	      is_available = @tictac.check_position_status(3)
	      assert_equal "", $error
	      assert_equal 1, is_available
	end 

	# Test to choose correct player to play 
	def test_choose_player 
		@tictac = TicTacToe.new
		$first_player = "Aakriti"
		$second_player = "Dushan"
		$active_player = "Aakriti"
		@tictac.choose_player
		# setting second player as active player
		assert_equal "Dushan", $active_player
		assert_equal "X", $active_symbol
		@tictac.choose_player
		# setting first player as active player
		assert_equal "Aakriti", $active_player
		assert_equal "O", $active_symbol
	end

	# Test to check current result of game 
	def test_check_result
		@tictac = TicTacToe.new

		$first_player = "Aakriti"
		$second_player = "Dushan"
		@tictac.welcome_message
    @tictac.initialize_board

		$active_player = "Dushan"
		$active_symbol = "X"

		# setting board values for win condition
		$board_position[0] ="X"
		$board_position[1] ="X"
		$board_position[2] ="X"
		@tictac.check_result
		assert_equal 1, $is_winner
		assert_equal "Dushan", $winner

		# setting board values for continue condition
		$board_position[0] ="X"
		$board_position[1] ="O"
		$board_position[2] ="X"
		@tictac.check_result
		assert_equal 0, $is_winner
		assert_equal 0, $is_draw

		# setting board values for continue condition
		$board_position[0] ="X"
		$board_position[1] ="O"
		$board_position[2] ="X"
		$board_position[3] ="O"
		$board_position[4] ="O"
		$board_position[5] ="X"
		$board_position[6] ="X"
		$board_position[7] ="O"
		$board_position[8] ="O"
		@tictac.check_result
		assert_equal 0, $is_winner
		assert_equal 1, $is_draw
	end

	# Test to check what entry is added for board no for the user # requires input from console
	def test_invalid_board_no 
  		@tictac = TicTacToe.new
  		$first_player = "Aakriti"
  		$second_player = "Dushan"
      @tictac.welcome_message
      @tictac.initialize_board
    	is_available = @tictac.check_choice
    	if (is_available == 0)
    		assert_equal "Bad Choice !! Please choose a no available on board !!", $error
    	else 
    		assert_equal "", $error
    	end
	end
end
