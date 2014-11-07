class Game < ActiveRecord::Base

  def self.selected_game(season_id, id)
    if season_id.nil? || id.nil?
      all.order('disp_order').last
    else
      find(id)
    end
  end

  def self.games_navi(season_id)
    where(season_id:season_id).order(:disp_order)
  end

end
