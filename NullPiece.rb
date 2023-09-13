require "singleton"
require_relative "piece"

class NullPiece < Piece
    include Singleton

    def initalize
        @color = :Blank
    end

    def symbol
        ''
    end

    def moves 
        return []
    end

    def empty?
        return true 
    end
end

