class Game < ActiveRecord::Base

  def self.selected_game(season_id, id)
    if id.nil?
      where(season_id: season_id).last
    else
      find(id)
    end
  end

  def self.games_navi(season_id)
    where(season_id:season_id).order(:disp_order)
  end

end
