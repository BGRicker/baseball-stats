class Player < ApplicationRecord
  has_many :seasons, :foreign_key => :player_id, :primary_key => :player_id

  def teams
    seasons.map(&:team_id).uniq
  end

  def has_seasons?
    !self.seasons.empty?
  end

  def career_stats(statistic)
    seasons.sum(&statistic.to_sym)
  end

  def full_name
    (first_name || "Mr.") + " " + last_name
  end
end
