require_relative "base"
module Presenters
  class Game < Base

    def to_json
      {
        id: object.id,
        token: object.token,
        duration: object.duration,
        board: object.board.characters
      }
    end

  end
end
