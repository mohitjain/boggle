class Board < ApplicationRecord
  has_many :games

  validates :characters, presence: true

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
