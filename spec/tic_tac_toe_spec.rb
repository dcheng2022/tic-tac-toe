require './tic-tac-toe'

describe Player do
  describe '#place_piece' do
    subject(:player_test) { described_class.new('x') }

    context 'when a new piece is initialized' do
      it 'increases number of pieces by one' do
        expect { player_test.place_piece }.to change { Player.total_num_of_pieces }.by(1)
      end
    end
  end

  describe '#player_win?' do
    subject(:game_win) { described_class.new('x') }

    context 'when a board has three matching pieces in a row' do
      let(:row_board) { [['x', 'x', 'x'], [' ', ' ', ' '],  [' ', ' ', ' ']] }
      let(:pos) { [0, 1] }

      it 'returns true' do
        result = game_win.player_win?(row_board, pos)
        expect(result).to be true
      end
    end

    context 'when a board has three matchign pieces in a column' do
      let(:column_board) { [[' ', ' ', 'x'], [' ', ' ', 'x'],  [' ', ' ', 'x']] }
      let(:pos) { [2, 2] }

      it 'returns true' do
        result = game_win.player_win?(column_board, pos)
        expect(result).to be true
      end
    end

    context 'when a board has three matching pieces diagonally' do
      let(:diagonal_board) { [[' ', ' ', 'x'], [' ', 'x', ' '],  ['x', ' ', ' ']] }
      let(:pos) { [1, 1] }

      it 'returns true' do
        result = game_win.player_win?(diagonal_board, pos)
        expect(result).to be true
      end
    end

    context 'when a board has no win conditions' do
      let(:losing_board) { [[' ', 'o', 'x'], [' ', 'x', 'o'],  [' ', 'x', ' ']] }
      let(:pos) { [2, 1] }

      it 'returns nil' do
        result = game_win.player_win?(losing_board, pos)
        expect(result).to be_nil
      end
    end

    context 'when a board has less than three pieces' do
      let(:board) { [[' ', ' ', 'x'], [' ', 'x', ' '],  [' ', ' ', ' ']] }
      let(:pos) { [0, 2] }

      it 'returns nil' do
        result = game_win.player_win?(board, pos)
        expect(result).to be_nil
      end
    end
  end
end