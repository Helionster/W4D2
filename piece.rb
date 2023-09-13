class Piece 
    attr_reader :color, :board, :pos

    def initalize(color, board, pos)
        @color = color
        @board = Board
        @pos = []
    end

    def to_s
        "p"
    end

    def empty?

    end

    def valid_moves

    end

    def pos=(val)

    end

    private
    def move_into_check?(end_pos)

    end
end