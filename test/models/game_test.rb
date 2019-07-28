# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
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

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
