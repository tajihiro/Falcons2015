class ScoreSheetController < ApplicationController
  def index
    #選択Season&Game取得
    if params[:season_id].nil?
        @selected_season = Season.current_season
        @selected_game = Game.current_game(Season.current_season)
    else
        @selected_season = Season.selected_season(params[:season_id])
        @selected_game = Game.selected_game(params[:season_id])
    end

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    @games_navi = Game.games_navi(@selected_season)
  end
end
