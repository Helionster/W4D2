module Slideable

    HORIZONTAL_DIRS = [
      [-1, 0],
      [1, 0],
      [0, 1],
      [0, -1]  
    ].freeze
  
    DIAGONAL_DIRS = [
      [-1, 1],
      [1, 1],
      [-1, -1],
      [1, -1]
    ].freeze
  
  
    def horizontal_dirs
      @horizontal_dirs = HORIZONTAL_DIRS
    end
  
    def diagonal_dirs
      @diagonal_dirs = DIAGONAL_DIRS
    end
  
    def moves
      possible_moves = []

      self.move_dirs.each do |dir|
        possible_moves += grow_unblocked_moves_in_dir(dir[0],dir[1])
      end

      possible_moves
    end 
  
    private
  
    def move_dirs
      raise NotImplementedError
    end
  
    def grow_unblocked_moves_in_dir(dx, dy)

      collect_moves = []
      current_pos = self.pos
  
        until !board.valid?(current_pos)
          new_pos = moves_adder(current_pos, dir)
          collect_moves << new_pos if new_pos == NullPiece.instance
          current_pos = new_pos
        end
            
        collect_moves << current_pos if board[current_pos].piece.color != self.color
      end

      collect_moves
    end

    def moves_adder([pos, dir])
      return [(pos[0] + dir[0]), (pos[1] + dir[1])]
    end
  end