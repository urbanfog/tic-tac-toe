class Game
  @@winner = false
  @@game_state = {'a1' => ' ', 'b1' => ' ', 'c1' => ' ',
                  'a2' => ' ', 'b2' => ' ', 'c2' => ' ',
                  'a3' => ' ', 'b3' => ' ', 'c3' => ' '}

  # Show gameboard
  def show_gameboard
    puts "
            | A | B | C |\r
          --+---+---+---+\r
          1 | #{@@game_state['a1']} | #{@@game_state['b1']} | #{@@game_state['c1']} |\r
          --+---+---+---+\r
          2 | #{@@game_state['a2']} | #{@@game_state['b2']} | #{@@game_state['c2']} |\r
          --+---+---+---+\r
          3 | #{@@game_state['a3']} | #{@@game_state['b3']} | #{@@game_state['c3']} |\r
          --+---+---+---+"
  end

  # get user input based on player number
  def get_user_input(player_number)
    valid_move = false
    until valid_move == true
      puts "#{player_number}, place your mark (e.g. A1)."
      move = gets.chomp
      if @@game_state[move] == ' '
        valid_move = true
        return move
      elsif @@game_state[move] == nil
        puts "\nHA! That is not a valid move, cheater! Try again."
      else
        puts "\nStop heathen!  That space is already taken. Try again."
      end
    end
  end
  
  # Establish win conditions (3 in a row)
  def check_winner(game_state)
    w1 = @@game_state.slice('a1', 'a2', 'a3').flatten.tally
    w2 = @@game_state.slice('b1', 'b2', 'b3').flatten.tally
    w3 = @@game_state.slice('c1', 'c2', 'c3').flatten.tally
    w4 = @@game_state.slice('a1', 'b1', 'c1').flatten.tally
    w5 = @@game_state.slice('a1', 'b2', 'c2').flatten.tally
    w6 = @@game_state.slice('a3', 'b3', 'c3').flatten.tally
    w7 = @@game_state.slice('a1', 'b2', 'c3').flatten.tally
    w8 = @@game_state.slice('a3', 'b2', 'c1').flatten.tally
    
    if w1['X'] == 3 || w2['X'] == 3 || w3['X'] == 3 || w4['X'] == 3 ||
       w5['X'] == 3 || w6['X'] == 3 || w7['X'] == 3 || w8['X'] == 3
      puts "\nPlayer 1 wins. Huzzah!"
      return true
    elsif w1['O'] == 3 || w2['O'] == 3 || w3['O'] == 3 || w4['O'] == 3 ||
          w5['O'] == 3 || w6['O'] == 3 || w7['O'] == 3 || w8['O'] == 3
      puts "\nPlayer 2 wins. Hoorah!"
      return true
    end
  end

  def play_game
    until @@winner == true
      show_gameboard
    
      player1_move = get_user_input('player1')
      @@game_state[player1_move] = 'X'
      show_gameboard
      if check_winner(@@game_state)
        break
      end
      
  
      player2_move = get_user_input('player2')
      @@game_state[player2_move] = 'O'
      show_gameboard
      if check_winner(@@game_state)
        break
      end
      
    end
    puts 'Game over. Thanks for playing.'
  end
end

tic_tac_toe = Game.new
tic_tac_toe.play_game