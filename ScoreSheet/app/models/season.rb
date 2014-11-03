class Season < ActiveRecord::Base

  def self.selected_season(id)
    find(id)
  end

  def self.current_season
    last
  end

  def self.seasons_menu
    season0 = where('id >=  1 and 10 > id').select(:id, :season_name).order('id DESC')
    season1 = where('id >= 10 and 20 > id').select(:id, :season_name).order('id DESC')
    season2 = where('id >= 20 and 30 > id').select(:id, :season_name).order('id DESC')
    season3 = where('id >= 30 and 40 > id').select(:id, :season_name).order('id DESC')
    [season3, season2, season1, season0]
  end
end
