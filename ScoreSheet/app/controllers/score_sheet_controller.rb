class ScoreSheetController < ApplicationController

  #
  # index
  #
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

    #Goals取得
    @goals = Goal.details(@game.id)
    #Penalties取得
    @game_panalties = GamePenalty.details(@game.id)

    #表示項目取得
    @divisions = Division.all
    @game_types =
    @season_teams = SeasonTeam.season_teams(@game.season_id)

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@season.id)
  end

  #
  # 新規登録画面表示処理
  #
  def new
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

    #Goals取得
    @goals = Goal.details(@game.id)
    #Penalties取得
    @game_panalties = GamePenalty.details(@game.id)

    #表示項目取得
    @divisions = Division.all
    @game_types =
        @season_teams = SeasonTeam.season_teams(@game.season_id)

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@season.id)
  end

  #
  # 新規登録処理
  #
  def create

  end

  #
  # 更新画面表示処理
  #
  def edit
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

    #Goals取得
    @goals = Goal.details(@game.id)
    #Penalties取得
    @game_panalties = GamePenalty.details(@game.id)

    #表示項目取得
    @divisions = Division.all
    @game_types =
        @season_teams = SeasonTeam.season_teams(@game.season_id)

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@season.id)
  end

  #
  # 更新処理
  #
  def update

  end

  #
  # 削除処理
  #
  def delete

  end

end
