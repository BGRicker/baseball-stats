class Player < ApplicationRecord
  has_many :seasons

  def seasons
    Season.where(player_id: self.player_id)
  end

  def has_seasons?
    !self.seasons.empty?
  end
end
