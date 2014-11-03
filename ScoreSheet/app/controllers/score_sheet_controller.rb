class ScoreSheetController < ApplicationController
  def index

    @selected_season = Season.selected_season(params[:season_id])
    @selected_game = Game.selected_game(params[:season_id],params[:game_id])

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@selected_season)
  end
end
