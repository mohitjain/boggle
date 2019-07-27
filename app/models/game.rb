class Game < ApplicationRecord
  belongs_to :board
  has_many :game_histories

  validates :duration, :points, :board_id, presence: true
  validates :token, uniqueness: true, presence: true
  validates :duration, :points, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }

  def time_left
    time_elapsed = (Time.now - created_at)

    return 0 if duration < time_elapsed

    (duration - time_elapsed).to_f(2)
  end

end

# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  duration   :integer          not null
#  points     :integer          default(0), not null
#  token      :string           not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#
# Indexes
#
#  index_games_on_token  (token) UNIQUE
#
