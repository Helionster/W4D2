class Piece 
    attr_reader :color, :board, :pos

    def initalize(color, board, pos)
        @color = color
        @board = Board
        @pos = []
    end

    def to_s
        self.symbol
    end

    def empty?
        return true if board[self.pos] == :nil 
        return false
    end

    def valid_moves
        self.move_dirs
    end

    def pos=(val)
        board[self.pos] = val
    end

    private
    def move_into_check?(end_pos)
        
    end
end