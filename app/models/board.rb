class Board < ApplicationRecord
  AVAILABLE_CHARACTERS = (("A".."Z").to_a + ["*"]).freeze
  BOARD_SIZE = (4*4).freeze

  has_many :games
  # Length validator can be improved
  validates :characters, presence: true, length: {
    is: (BOARD_SIZE * 2 - 1)
  }

  def display
    [
      characters[0..6].split(","),
      characters[8..14].split(","),
      characters[16..22].split(","),
      characters[24..31].split(",")
    ]
  end

  def api_characters
    characters.split(",").join(", ")
  end

  def self.build_with_random_characters
    board = new
    board.characters = generate_random_characters.join(",")
    board
  end

  def self.generate_random_characters
    characters = []
    BOARD_SIZE.times.each do
      characters.push(AVAILABLE_CHARACTERS[rand(27)])
    end
    characters
  end

  private_class_method :generate_random_characters

end

# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  characters :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
