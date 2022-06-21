require 'pry-byebug'
game_board = Array.new(3) { Array.new(3, ' ') }

class Player 
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

  private

  attr_reader :piece
end

def input_getter
  puts 'Enter a position.'
  loop do
    input = gets.chomp.upcase.split('')
    next unless input.length == 2 && ('A'..'C').include?(input[0]) && ('1'..'3').include?(input[1])

    input[0] = input[0].ord - 65
    input[1] = input[1].to_i - 1
    return input
  end
end
