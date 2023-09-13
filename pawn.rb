require_relative "piece"

class Pawn

    def symbol
        '♙'
    end 

    def moves 
        [self.forward_steps] += self.side_attacks
    end

    private
    def at_start_row?
        if self.color == :white
            return true if self.pos[1] == 1
        elsif self.color == :black
            return true if self.pos[1] == 6
        end
        false
    end

    def forward_dir
        if self.color == :white
            return 1
        else
            return -1
        end
    end

    def forward_steps
        if self.at_start_row?
            if moves_adder(self.pos, [self.forward_dir, 0]) == NullPiece.instance && moves_adder(self.pos, [self.forward_dir * 2, 0]) == NullPiece.instance
                return [[self.forward_dir, 0], [[self.forward_dir * 2, 0]]] 
            elsif if moves_adder(self.pos, [self.forward_dir, 0]) == NullPiece.instance
                return [[self.forward_dir, 0]]
            else
                return []
            end 
        else
            if moves_adder(self.pos, [self.forward_dir, 0]) == NullPiece.instance
                return [[self.forward_dir, 0]]
            else
                return []
            end
        end
    end

    def side_attacks
        moves_array = []
        
        if board.moves_adder(self.pos,[self.forward_dir, -1]).color != self.color
            moves_array << board.moves_adder(self.pos,[self.forward_dir, -1])
        elsif board.moves_adder(self.pos,[self.forward_dir, 1]).color != self.color
            moves_array << board.moves_adder(self.pos,[self.forward_dir, 1])
        end

        moves_array
    end

    def moves_adder([pos, dir])
        return [(pos[0] + dir[0]), (pos[1] + dir[1])]
    end
end