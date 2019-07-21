class GameHistory < ApplicationRecord
  belongs_to :game
  
  validates :points, :valid, :word, :game, presence: true
  validates :points, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }

end

# == Schema Information
#
# Table name: game_histories
#
#  id         :integer          not null, primary key
#  points     :integer          default(0), not null
#  valid      :boolean          default(FALSE), not null
#  word       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer          not null, indexed
#
# Indexes
#
#  index_game_histories_on_game_id  (game_id)
#
