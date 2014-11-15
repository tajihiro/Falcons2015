class ScoreSheetController < ApplicationController
  def index
    season_id = params[:season_id]
    game_id = params[:game_id]
    #Game取得
    @game = Game.selected_game(season_id,game_id)
    @season = Season.selected_season(@game.season_id)


    #SeasonMembers取得
    @season_members = SeasonMember.where(season_id:@game.season_id)
    #GameMembers取得
    @game_goalies = GameMember.game_goalies(@game.id)
    @game_players = GameMember.game_players(@game.id)

    #表示項目取得
    @divisions = Division.all
    @season_teams = SeasonTeam.season_teams(@game.season_id)

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@season.id)


  end
end
