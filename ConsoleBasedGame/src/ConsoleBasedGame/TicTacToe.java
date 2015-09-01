package ConsoleBasedGame;

import java.util.Scanner;

public class TicTacToe {

	protected String first_player = null;
	protected String second_player = null;
	protected char[] board_position = new char[9];
	protected String active_player = null;
	protected char active_symbol ;
	boolean is_winner = false;
	protected String winner = null;
	boolean is_draw = false;

	public TicTacToe() {
		first_player = "Default1";
		second_player = "Default2";
	}

	public void get_multi_player () {
		try{

			System.out.println ("==================================");
			System.out.println ("       Welcome to Tic Tac Toe     ");
			System.out.println ("==================================");

			System.out.println ("Enter First Player : ");
			@SuppressWarnings("resource")
			Scanner player_one = new Scanner (System.in);
			first_player = player_one.nextLine();
			System.out.println ("Enter Second Player : ");
			@SuppressWarnings("resource")
			Scanner player_two = new Scanner (System.in);
			second_player = player_two.nextLine();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void welcome_message () {
		try {
			System.out.println ("\n" + this.first_player.toUpperCase() + " gets 'Noughts(Os)' and " + this.second_player.toUpperCase() + " gets Crosses(Xs)" );
			System.out.println ("GOOD LUCK !! May the best person wins !! \n\n");
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void initialize_board () {
		try {
			char [] board_position_def = {'1','2','3','4','5','6','7','8','9'};
			this.active_player = this.first_player;
			this.active_symbol = 'O';
			for (int index = 0 ; index < 9 ; index++) {
				this.board_position[index] = board_position_def[index]; 
			}
			this.current_board_design();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void current_board_design () {
		try {
			System.out.println(  "\n" );

			System.out.println(  "\n\t\t" + "   | " + this.board_position [0] + "  |  " + this.board_position [1] + "  |  " + this.board_position [2] + "  |  ");
			System.out.println(  "  \t\t" + "   |____|_____|_____| ");
			System.out.println(  "\n\t\t" + "   | " + this.board_position [3] + "  |  " + this.board_position [4] + "  |  " + this.board_position [5] + "  |  ");
			System.out.println(  "  \t\t" + "   |____|_____|_____| ");
			System.out.println(  "\n\t\t" + "   | " + this.board_position [6] + "  |  " + this.board_position [7] + "  |  " + this.board_position [8] + "  |  ");
			System.out.println(  "  \t\t" + "   |    |     |     | ");

			System.out.println(  "\n" );
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void play_game () {
		try {
			int choice;
			do {
				System.out.println("\n" + this.active_player + " choose a position to play");
				boolean is_available = false;
				do {
					@SuppressWarnings("resource")
					Scanner input = new Scanner(System.in);
					choice = input.nextInt();
					if(choice > 0 && choice < 10 ) {
						is_available = this.check_position_status(choice-1);
						if (is_available == true) {
							this.board_position[choice-1] = this.active_symbol;
						}
					}
					else {
						System.out.println("Bad Choice !! Please choose a no available on board !!");
						is_available = false;
					}
				} while (! is_available);	

				this.current_board_design();
				this.check_result();
				this.choose_player();

			} while (! is_winner && ! is_draw);
			
			if (is_winner) {
				System.out.println ("\nNice Game !!! \n" + this.winner.toUpperCase() + " is the WINNER !!!");
			}
			else if (is_draw) {
				System.out.println("\nNice Try !!! It's a DRAW !!!");
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public boolean check_result( ){
		int index_counter = 0;
		if ( ( this.board_position[0] == this.active_symbol && this.board_position[1] == this.active_symbol && this.board_position[2] == this.active_symbol ) ||
				( this.board_position[3] == this.active_symbol && this.board_position[4] == this.active_symbol && this.board_position[5] == this.active_symbol ) || 
				( this.board_position[6] == this.active_symbol && this.board_position[7] == this.active_symbol && this.board_position[8] == this.active_symbol ) ||
				( this.board_position[0] == this.active_symbol && this.board_position[3] == this.active_symbol && this.board_position[6] == this.active_symbol ) ||
				( this.board_position[1] == this.active_symbol && this.board_position[4] == this.active_symbol && this.board_position[7] == this.active_symbol ) ||
				( this.board_position[2] == this.active_symbol && this.board_position[5] == this.active_symbol && this.board_position[8] == this.active_symbol ) ||
				( this.board_position[0] == this.active_symbol && this.board_position[4] == this.active_symbol && this.board_position[8] == this.active_symbol ) ||
				( this.board_position[2] == this.active_symbol && this.board_position[4] == this.active_symbol && this.board_position[6] == this.active_symbol ) 
				) {
			this.is_winner = true;
			this.winner = this.active_player;
			return is_winner;
		}
		else {
			for (int index = 0 ; index < 9 ; index++ ) {
				if (this.board_position[index] == 'X' || this.board_position[index] == 'O') {
					index_counter ++;
				}
			}
			if (index_counter == 9){
				this.is_draw = true;
				return is_draw;
			}
			else {
				this.is_draw = false;
				this.is_winner = false;
				return is_winner;
			}
		}
	}

	public boolean check_position_status (int choice) {
		try {
			if (this.board_position[choice] == 'X' || this.board_position[choice] == 'O' ) {
				System.out.println((choice + 1) + "is already filled, Please choose a another position !!");
				return false;
			}
			else {
				return true;
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public void choose_player () {
		if (this.active_player.equals(this.first_player)) {
			this.active_player = this.second_player;
			this.active_symbol = 'X';
		}
		else {
			this.active_player = this.first_player;
			this.active_symbol = 'O';
		}
	}

	public static void main (String[] args) {
		try {
			TicTacToe toe = new TicTacToe();

			toe.get_multi_player();
			toe.welcome_message();
			toe.initialize_board();
			toe.play_game();

		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}