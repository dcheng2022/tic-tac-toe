require 'pry-byebug'

class Player 
  attr_reader :piece
  @@total_num_of_pieces = 0

  def initialize(piece)
    @piece = piece
  end

  def self.total_num_of_pieces
    @@total_num_of_pieces
  end

  def place_piece
    @@total_num_of_pieces += 1
    piece
  end

  def player_win?
  end

  def game_draw? 
  end
end

def input_getter(game_board)
  puts 'Enter a position.'
  loop do
    input = gets.chomp.upcase.split('')
    unless input.length == 2 && ('A'..'C').include?(input[0]) && ('1'..'3').include?(input[1])
      puts 'Invalid input received. Please enter A, B, or C followed by 1, 2, or 3.'
      next
    end
    input[0] = input[0].ord - 65
    input[1] = input[1].to_i - 1
    if %w[X O].include?(game_board[input[0]][input[1]])
      puts 'Position already occupied. Please enter another coordinate.'
    else
      return input
    end
  end
end

def choose_pieces
  pieces = %w[X O]
  loop do
    puts "Would you like to play with X's or O's?"
    selected_piece = gets.chomp.upcase
    if pieces.include?(selected_piece)
      player_one = Player.new(pieces.delete(selected_piece))
      player_two = Player.new(pieces.join)
      return [player_one, player_two]
    end
  end
end

def game
  game_board = Array.new(3) { Array.new(3, ' ') }
  player_array = choose_pieces
  loop do
    player = Player.total_num_of_pieces.even? ? player_array[0] : player_array[1]
    puts "#{player.piece}'s turn."
    input = input_getter(game_board)
    game_board[input[0]][input[1]] = player.place_piece
    game_board.each { |row| p row }
  end
end

game
