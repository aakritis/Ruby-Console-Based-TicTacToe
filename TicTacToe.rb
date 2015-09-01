# My First Ruby Program -- This program plays the game of Tic Tac Toe

# to update board values to X and O without updating initial indexes 
$board_position = Array.new
# declaring global variables to use throughout functions
$first_player = String.new
$second_player = String.new
$active_player = String.new
$active_symbol = String.new
$is_winner = 0
$is_draw = 0 
$winner = String.new
$error = String.new

class TicTacToe
    # function to get multi players for game and welcome screen
    def get_multi_player 
        puts "=================================="
        puts "       Welcome to Tic Tac Toe     "
        puts "=================================="

        # temp variable to validate user names 
        is_valid = 0
        begin
            puts "Enter first player :"
            $first_player = gets
            $first_player.chop!
            puts "Enter second player :"
            $second_player = gets
            $second_player.chop!    
            first_player_in = $first_player
            second_player_in = $second_player
            is_valid = check_valid_players(first_player_in, second_player_in)
        end while (is_valid != 1)    
    end

    def check_valid_player(first_player, second_player)
        is_valid = 0;
        if ( first_player != "" and second_player != "")
            $error = ""
            is_valid = 1
        else 
            $error = "Bad Choice ! Name Fields cannot be Empty"
            puts "Bad Choice ! Name Fields cannot be Empty"
            is_valid = 0                    
        end
        if ([first_player,second_player].uniq.length == 1)
            $error = "Bad Choice ! Names cannot be same"
            puts "Bad Choice ! Names cannot be same"
            is_valid = 0
        end
        return is_valid
    end

    # to display welcome message and instructions for users after validation
    def welcome_message 
        puts "\n #{$first_player.upcase} gets 'Noughts(Os)' and #{$second_player.upcase} gets Crosses(Xs)"  
    end

    # to set the initial board to play 
    def initialize_board
        $board_position_def = ['1','2','3','4','5','6','7','8','9']
        # default set of first player as active player and assigning O as symbol on initial step
        $active_player = $first_player
        $active_symbol = "O"
        index = 0
        begin
            $board_position = $board_position_def
            index += 1
        end while index < 9 
        # calling function to update board design
        current_board_design
    end 

    # display the design of board based on board values of X / O and indexes
    def current_board_design
        puts "\n"
        puts "\n\t\t" + "   | " + "#{$board_position[0]}" + "  |  " + "#{$board_position[1]}" + "  |  " + "#{$board_position[2]}" + "  |  "
        puts "  \t\t" + "   |____|_____|_____| "
        puts "\n\t\t" + "   | " + "#{$board_position[3]}" + "  |  " + "#{$board_position[4]}" + "  |  " + "#{$board_position[5]}" + "  |  "
        puts "  \t\t" + "   |____|_____|_____| "
        puts "\n\t\t" + "   | " + "#{$board_position[6]}" + "  |  " + "#{$board_position[7]}" + "  |  " + "#{$board_position[8]}" + "  |  "
        puts "  \t\t" + "   |    |     |     | "
        puts "\n"

    end 

    # to write test case for Homework 3
    def get_user_input
        gets.chomp.to_i
    end

    # to write test case for Homework 3
    def get_available_slot
        begin
            is_available = check_choice
        end while (is_available == 0)
    end

    # to write test case for Homework 3
    def check_choice
        choice = get_user_input
        if (choice > 0 and choice < 10) 
            $error = ""
            is_choice = choice - 1
            is_available = check_position_status(is_choice)
            if (is_available == 1)  
                $board_position[choice - 1] = $active_symbol
            end
        else 
            $error = "Bad Choice !! Please choose a no available on board !!"
            puts "Bad Choice !! Please choose a no available on board !!"
            is_available = 0                    
        end
        return is_available
    end

    # main function with code for play
    def play_game
        begin 
          # to check input from player and validate win/draw for a roll
            puts "\n" + "#{$active_player.upcase}" + " choose a position to play"
            is_available = 0
            # do while loop for multi check of valid input indexes 
            get_available_slot
            # function calls to set new board design , check result after this iteration and choose the next active player
            current_board_design
            check_result
            choose_player

            # to display the winner 
            if ($is_winner == 1) 
                puts "\nNice Game !!! \n" + "#{$winner.upcase}" + " is the WINNER !!!"
            elsif ($is_draw == 1)
                puts "\nNice Try !!! It's a DRAW !!!"
            end
        end while ($is_winner == 0 and $is_draw == 0)
    end

    # to check whether requested index is available 
    def check_position_status(choice)
        if ($board_position[choice] == "X" or $board_position[choice] == "O")
            $error = "#{(choice + 1)} " + "is already filled, Please choose a another position !!"    
            puts "#{(choice + 1)} " + "is already filled, Please choose a another position !!"    
            return 0
        else
            $error = ""
            return 1
        end
    end

    # to validate whether their is a winner or a draw or game continues
    def check_result
        index_counter = 0
        # puts "#{$active_symbol} is the active_symbol"
        # to check various combinations for win
        if (( $board_position[0] == $active_symbol and $board_position[1] == $active_symbol and $board_position[2] == $active_symbol ) or ( $board_position[3] == $active_symbol and $board_position[4] == $active_symbol and $board_position[5] == $active_symbol ) or ( $board_position[6] == $active_symbol and $board_position[7] == $active_symbol and $board_position[8] == $active_symbol ) or ( $board_position[0] == $active_symbol and $board_position[3] == $active_symbol and $board_position[6] == $active_symbol ) or ( $board_position[1] == $active_symbol and $board_position[4] == $active_symbol and $board_position[7] == $active_symbol ) or ( $board_position[2] == $active_symbol and $board_position[5] == $active_symbol and $board_position[8] == $active_symbol ) or ( $board_position[0] == $active_symbol and $board_position[4] == $active_symbol and $board_position[8] == $active_symbol ) or ( $board_position[2] == $active_symbol and $board_position[4] == $active_symbol and $board_position[6] == $active_symbol )) 
            $is_winner = 1
            $winner = $active_player
            ret_val = $is_winner
        else 
            # puts "in else loop"
            index = 0
            begin
                if ($board_position[index] == "X" or $board_position[index] == "O") 
                    index_counter += 1    
                end
                index += 1
            end while (index < 9)
            # puts "#{index_counter} is the index_counter value"
            # check if entire board is filled and declare a draw
            if (index_counter == 9) 
                $is_draw = 1
                ret_val = $is_draw
            else
                $is_draw = 0
                $is_winner = 0
                ret_val = $is_winner
            end
        end
        return ret_val
    end

    # to update active player after every iteration
    def choose_player 
        if ($active_player == $first_player) 
            $active_player = $second_player
            $active_symbol = "X"
        else 
            $active_player = $first_player
            $active_symbol = "O"
        end
    end

    # start of program
    def main 
        active_player = String.new
        # various function calls to set players, display conditions , initialize board and start play 
        get_multi_player
        welcome_message
        initialize_board
        play_game
    end 
end

# to ensure openning function for program
tictac = TicTacToe.new()
# tictac.main