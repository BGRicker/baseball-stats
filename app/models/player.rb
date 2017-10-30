class Player < ApplicationRecord
  has_many :seasons, :foreign_key => :player_id, :primary_key => :player_id

  def teams
    seasons.map(&:team_id).uniq
  end

  def has_seasons?
    !seasons.empty?
  end

  def career_stats(statistic)
    if statistic == "slugging_percentage"
      career_slugging_percentage
    elsif statistic == "batting_average"
      career_batting_average
    else
      seasons.sum(&statistic.to_sym)
    end
  end

  def career_batting_average
    career_hits = seasons.map(&:hits).sum
    career_at_bats = seasons.map(&:at_bats).sum
    (career_hits / career_at_bats.to_f).round(3)
  end

  def career_slugging_percentage
    career_bases_score = seasons.map(&:singles).sum + (2 *  seasons.map(&:doubles).sum) +
      ( 3 * seasons.map(&:triples).sum) + ( 4 * seasons.map(&:home_runs).sum)
    (career_bases_score / seasons.map(&:at_bats).sum.to_f).round(3)
  end

  def full_name
    (first_name || "Mr.") + " " + last_name
  end
end
