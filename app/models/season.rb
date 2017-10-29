class Season < ApplicationRecord
  has_one :player, :foreign_key => :player_id, :primary_key => :player_id

  def batting_average
    (hits / at_bats.to_f).round(3)
  end

  def singles
    negated = doubles + triples + home_runs
    hits - negated
  end

  # the parens here aren't affecting the math, but I think this helps to
  # understand the logic behind the slugging percentage
  def slugging_percentage
    bases_score = singles + (2 * doubles) + (3 * triples) + (4 * home_runs)
    (bases_score / at_bats.to_f).round(3)
  end
end
