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

require 'test_helper'

class GameHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
