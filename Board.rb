require 'byebug'
require_relative 'piece.rb'

class Board
    attr_accessor :board
    def initialize
        debugger
        @board = Array.new(8) {Array.new(8,:nil)}
        
        (0..7).each do |row|
            (0..7).each do |col|
                if (0..1).include?(row) || (6..7).include?(row)
                    @board[row][col] = Piece.new
                end
            end
        end
        # p @board
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
        raise 'No piece selected.' if start_pos == :nil 
        raise 'Cant move there' if @board[end_pos] == '1'

        holder_piece = @board[start_pos]
        @board[start_pos] = :nil 
        @board[end_pos] = holder_piece
    end
end