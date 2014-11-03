class Game < ActiveRecord::Base

  def self.games_navi(season_id)
    where(season_id:season_id).order(:disp_order)
  end

  def self.selected_game(season_id)
    where(season_id).last
  end
end
