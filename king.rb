require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  def symbol
    '♚'
  end

  protected

  def move_diffs
    king_dirs
  end
end