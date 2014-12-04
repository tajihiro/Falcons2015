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

    #新規インスタンス取得
    @game = Game.new
    #初期値設定
    @game.season_id = season_id
    @game.team_id = 1
    @game.game_place = 'MiSC'
    @game.division_id = 4
    @game.game_type_id = 2

    #Season情報取得
    @season = Season.selected_season(@game.season_id)
    @season_goalies = SeasonMember.season_goalies(@season.id)
    @season_players = SeasonMember.season_players(@season.id)

    #コンポーネント項目取得
    @seasons = Season.all.order('id DESC')
    @game_types = GameType.all
    @divisions = Division.all
    @season_teams = SeasonTeam.season_teams(@season.id)
    @goals = Array.new(15,Goal.new)
    @game_panalties = Array.new(10, GamePenalty.new)

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@season.id)
  end

  #
  # 更新画面表示処理
  #
  def edit
    season_id = params[:season_id]
    game_id = params[:game_id]
    season_id = params[:season_id]

    #新規インスタンス取得
    @game = Game.new
    #初期値設定
    @game.game_place = 'MiSC'
    @game.division_id = 4
    @game.game_type_id = 2

    #
    @season = Season.selected_season(@game.season_id)
    @season_goalies = SeasonMember.season_goalies(@season.id)
    @season_players = SeasonMember.season_players(@season.id)

    #表示項目取得
    @seasons = Season.all.order('id DESC')
    @game_types = GameType.all
    @divisions = Division.all
    @season_teams = SeasonTeam.season_teams(@season.id)
    @goals = Array.new(15,Goal.new)
    @game_panalties = Array.new(10, GamePenalty.new)

    #Seasonメニュー取得
    @seasons_menu = Season.seasons_menu
    #Gameナビ取得
    @games_navi = Game.games_navi(@season.id)
  end

  #
  # 新規登録処理
  #
  def create
    #パラメータ取得
    #Game
    @game = Game.new(game_params)
    #GameMembers
    member_ids = params[:member_id]
    goals = params[:goal]
    assists = params[:assist]
    penalties = params[:penalties]
    goal_againsts = params[:goal_against]
    shots_on_goals = params[:shots_on_goal]
    shots_againsts = params[:shots_against]
    goalie_flgs = params[:goalie_flg]
    mvp_flgs = params[:mvp_flg]
    join_flgs = params[:join_flg]
    #Goals
    goal_nos = params[:goal_no]
    goal_periods = params[:goal_period]
    goal_mins = params[:goal_min]
    goal_secs = params[:goal_sec]
    goal_member_ids = params[:goal_member_id]
    assist1_member_ids = params[:assist1_member_id]
    assist2_member_ids = params[:assist2_member_id]
    #Penalties
    penalty_nos = params[:penalty_no]
    penalty_ids = params[:penalty_id]
    penalty_periods = params[:penalty_period]
    penalty_mins = params[:penalty_min]
    penalty_secs = params[:penalty_sec]
    penalty_times = params[:penalty_time]
    penalty_member_ids = params[:penalty_member_id]

    #登録処理
    respond_to do |format|
      Game.transaction do
        #Game登録
          if @game.save then
          #GameMember登録
          member_ids.each_with_index do |member_id, i|
            if !join_flgs.nil? then
              if join_flgs.key?(member_id) then
                @game_member = GameMember.new
                @game_member.game_id = @game.id
                @game_member.member_id = member_ids[i]
                @game_member.goal = goals[i]
                @game_member.assist = assists[i]
                @game_member.goal_against = goal_againsts[i]
                #@game_member.shots_on_goal = shots_on_goals[i]
                @game_member.shots_against = shots_againsts[i]
                @game_member.penalties = penalties[i]
                @game_member.goalie_flg = goalie_flgs[i].nil? ? 0 : 1
                if !mvp_flgs.nil? then
                  @game_member.mvp_flg = (mvp_flgs.key?(member_id) ? 1 : 0)
                end
                @game_member.save
              end
            end
          end
          #Goals登録
          goal_nos.each_with_index do |goal_no, i|
            @goal = Goal.new
            @goal.game_id = @game.id
            @goal.period = goal_periods[i]
            @goal.goal_min = goal_mins[i]
            @goal.goal_sec = goal_secs[i]
            @goal.goal_member_id = goal_member_ids[i]
            @goal.assist1_member_id = assist1_member_ids[i]
            @goal.assist2_member_id = assist2_member_ids[i]
            @goal.save
          end
          #Penalties登録
          penalty_nos.each_with_index do |penalty_no, i|
            @penalty = GamePenalty.new
            @penalty.game_id = @game.id
            @penalty.period = penalty_periods[i]
            @penalty.penalty_min = penalty_mins[i]
            @penalty.penalty_sec = penalty_secs[i]
            @penalty.penalty_time = penalty_times[i]
            @penalty.penalty_member_id = penalty_member_ids[i]
            @penalty.penalty_id = penalty_ids[i]
            @penalty.save
          end
          format.html { redirect_to score_sheet_index_path, notice: 'Game was successfully created.' }
        end
      end
    end
  end


  #
  # 更新処理
  #
  def update
    #パラメータ取得

    #更新処理
    respond_to do |format|
      Game.transaction do


      end
      format.html { redirect_to score_sheet_index_path, notice: 'Game was successfully updated.' }
    end
  end

  #
  # 削除処理
  #
  def destroy
    #削除処理
    respond_to do |format|
      Game.transaction do

      end
      format.html { redirect_to score_sheet_index_path, notice: 'Game was successfully deleted.' }
    end

  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params[:game].permit(:season_id, :division_id, :team_id, :game_type_id, :game_name,
                         :home_team_id, :home_team_p1_score, :home_team_p2_score, :home_team_ot_score, :home_team_score,
                         :home_team_p1_shots, :home_team_p2_shots, :home_team_ot_shots, :home_team_shots,
                         :away_team_id, :away_team_p1_score, :away_team_p2_score, :away_team_ot_score, :away_team_score,
                         :away_team_p1_shots, :away_team_p2_shots, :away_team_ot_shots, :away_team_shots,
                         :game_date, :game_time, :game_place, :movie_url, :comments, :disp_order
    )
  end

end
