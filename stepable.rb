module Stepable

    KING_DIRS = [
        [-1, 0],
        [1, 0],
        [0, 1],
        [0, -1], 
        [-1, 1],
        [1, 1],
        [-1, -1],
        [1, -1]
    ].freeze
  
    KNIGHT_DIRS = [
        [2, 1],
        [-2, 1],
        [2, -1],
        [-2, -1], 
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2]
    ].freeze
  
    def king_dirs
      @king_dirs = KING_DIRS
    end
  
    def knight_dirs
      @knight_dirs = KING_DIRS
    end

    def moves
      new_moves = []

      self.move_dirs.each do |dir|
        new_pos = moves_adder(self.pos, dir)
        new_moves << new_pos if self.valid?(new_pos)
      end

      new_moves << new_pos if board[new_pos].piece.color != self.color

      new_moves
    end
  
    private
  
    def move_diffs
      raise NotImplementedError
    end

    def moves_adder([pos, dir])
        return [(pos[0] + dir[0]), (pos[1] + dir[1])]
    end
  end