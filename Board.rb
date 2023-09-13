require_relative 'piece.rb'
require_relative 'NullPiece.rb'

class Board
    attr_accessor :board
    def initialize
        @board = Array.new(8) {Array.new(8,NullPiece.instance)}
        
        (0..7).each do |row|
            (0..7).each do |col|
                if (0..1).include?(row) || (6..7).include?(row)
                    self[[row,col]] = Piece.new
                end
            end
        end
    end

    def [](pos)
        row,col = pos 
        @board[row][col] 
    end

    def []=(pos,value)
        row,col = pos 
        @board[row][col] = value
    end

    def move_piece(start_pos,end_pos)
        raise 'No piece selected.' if start_pos == NullPiece.instance
        raise 'Cant move there' if self[end_pos] == '1'

        holder_piece = self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos] = holder_piece
    end

    def valid?(pos)
        return false if !(0..7).include?(pos[0]) || if !(0..7).include?(pos[1])
        return true
    end

    def render
        @board.each do |row|
            puts row.join(" ")
        end
    end
end