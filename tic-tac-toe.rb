game_board = Array.new(2) { Array.new(3) }

class Player 
  @@total_num_of_pieces = 0

  def initialize(piece)
    @piece = piece
  end

  def place_piece(pos)
  end

  def player_win?
  end

  def game_draw? 
  end
end
