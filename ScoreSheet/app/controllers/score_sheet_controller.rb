class ScoreSheetController < ApplicationController
  def index
    season_id = params[:season_id]
    game_id = params[:game_id]

    @selected_season = Season.selected_season(season_id)
    @selected_game = Game.selected_game(season_id, game_id)

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@selected_season)
  end
end
