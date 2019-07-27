class GameHistory < ApplicationRecord
  belongs_to :game

  validates :points, :word, :game, presence: true
  validates :points, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }
  validates :word, uniqueness: {
    scope: :game_id
  }

end

# == Schema Information
#
# Table name: game_histories
#
#  id         :integer          not null, primary key
#  accepted   :boolean          default(FALSE), not null
#  points     :integer          default(0), not null
#  word       :string           not null, indexed => [game_id]
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer          not null, indexed => [word]
#
# Indexes
#
#  index_game_histories_on_game_id_and_word  (game_id,word) UNIQUE
#
