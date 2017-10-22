class Season < ApplicationRecord
  has_one :player

  def player
    Player.where(player_id: self.player_id).first
  end
end
