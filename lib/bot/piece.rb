module Piece
  module I
    def self.matrix
      [
        ['1', '1', '1', '1']
      ]
    end
  end

  module J
    def self.matrix
      [
        ['1', '0', '0'],
        ['1', '1', '1']
      ]
    end
  end

  module L
    def self.matrix
      [
        ['0', '0', '1'],
        ['1', '1', '1']
      ]
    end
  end

  module O
    def self.matrix
      [
        ['1', '1'],
        ['1', '1']
      ]
    end
  end

  module S
    def self.matrix
      [
        ['0', '1', '1'],
        ['1', '1', '0']
      ]
    end
  end

  module T
    def self.matrix
      [
        ['0', '1', '0'],
        ['1', '1', '1']
      ]
    end
  end

  module Z
    def self.matrix
      [
        ['1', '1', '0'],
        ['0', '1', '1']
      ]
    end
  end
end
