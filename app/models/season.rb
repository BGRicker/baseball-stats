class Season < ApplicationRecord
  has_one :player, :foreign_key => :player_id, :primary_key => :player_id
end
