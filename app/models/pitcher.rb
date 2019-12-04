class Pitcher < ApplicationRecord
  def self.most_winners_in_term(start_year, end_year)
    pitchers = Pitcher.where(year_id: start_year..end_year)
    max_win = pitchers.maximum(:wins)
    best_pitchers = pitchers.where(wins: max_win)
    best_pitchers.pluck(:player_id)
  end
end
