require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  

  def symbol
    '♛'.colorize(color)
  end

  protected

  def all_possible_moves
    @horizontal_dirs.concat(@diagonal_dirs)
  end

  def move_dirs
    moves = []
    current_pos = self.pos.clone

    self.all_possible_moves.each do |dir|
        until current_pos != :nil
            new_pos = moves_adder(pos, dir)
            moves << new_pos if new_pos == :nil
            current_pos = new_pos
        end
            
        moves << current_pos if current_pos != self.color
    end
    moves
  end

  def moves_adder([pos, dir])
    return [(pos[0] + dir[0]), (pos[1] + dir[1])]
  end
end