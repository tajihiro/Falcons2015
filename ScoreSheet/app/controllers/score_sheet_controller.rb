class ScoreSheetController < SessionController
  skip_before_filter :check_login, only: 'index'

  #
  # index
  #
  def index
    season_id = params[:season_id]
    game_id = params[:game_id]
    #Game取得
    @game = Game.selected_game(season_id,game_id)
    @season = Season.selected_season(@game.season_id)

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
    @game.team_id = 1 #Falcons
    @game.game_place = 'MiSC' #MiSC
    @game.division_id = 4 #Bronze
    @game.game_type_id = 1 #Season

    #Season情報取得
    @season = Season.selected_season(@game.season_id)

    #コンポーネント項目取得
    @seasons = Season.all.order('id DESC')
    @game_types = GameType.all
    @divisions = Division.all
    @penalties = Penalty.penalties
    @season_teams = SeasonTeam.season_teams(@season.id)
    #入力枠
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
    #登録済インスタンス取得
    #Game情報取得
    @game = Game.find(params[:id])
    #GameMembers取得
    @game_goalies = GameMember.game_goalies(@game.id)
    @game_players = GameMember.game_players(@game.id)
    #Goals取得
    @goals = Goal.details(@game.id)
    #Penalties取得
    @game_panalties = GamePenalty.details(@game.id)

    #Season情報取得
    @season = Season.selected_season(@game.season_id)
    @season_goalies = SeasonMember.season_goalies(@season.id)
    @season_players = SeasonMember.season_players(@season.id)

    #コンポーネント項目取得
    @seasons = Season.all.order('id DESC')
    @game_types = GameType.all
    @divisions = Division.all
    @penalties = Penalty.penalties
    @season_teams = SeasonTeam.season_teams(@season.id)

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
    @game.season_id = params[:season_id]
    @game.home_team_id = params[:home_team_id]
    @game.away_team_id = params[:away_team_id]
    @game.game_type_id = params[:game_type_id]
    #GameMembers
    member_ids = params[:member_id]
    goals = params[:goal]
    assists = params[:assist]
    penalties = params[:penalties]
    goal_againsts = params[:goal_against]
    shots_againsts = params[:shots_against]
    shots_on_goals = params[:shots_on_goal]
    goalie_flgs = params[:goalie_flg]
    mvp_flgs = params[:mvp_flg]
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
            if member_id.present?
              @game_member = GameMember.new
              @game_member.game_id = @game.id
              @game_member.member_id = member_ids[i]
              @game_member.goal = goals[i]
              @game_member.assist = assists[i]
              @game_member.goal_against = goal_againsts[i]
              @game_member.shots_against = shots_againsts[i]
              @game_member.shots_on_goal = shots_on_goals[i]
              @game_member.penalties = penalties[i]
              @game_member.goalie_flg = goalie_flgs[i]
              unless mvp_flgs.nil?
                @game_member.mvp_flg = (mvp_flgs.key?(member_ids[i]) ? 1 : 0)
              end
              @game_member.save
            end
          end
          #Goals登録
          goal_nos.each_with_index do |goal_no, i|
            if goal_periods[i].to_i > 0
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
          end
          #Penalties登録
          penalty_nos.each_with_index do |penalty_no, i|
            if penalty_periods[i].to_i > 0
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
          end
          format.html { redirect_to score_sheet_index_path(game_id:@game.id), notice: '登録成功しました。' }
        else
          format.html { redirect_to :back, notice: '登録失敗しました。' }
        end
      end
    end
  end


  #
  # 更新処理
  #
  def update
    #パラメータ取得
    #Game
    @game = Game.find(params[:id])
    @game.season_id = params[:season_id]
    @game.home_team_id = params[:home_team_id]
    @game.away_team_id = params[:away_team_id]
    @game.game_type_id = params[:game_type_id]

    #GameMembers
    member_ids = params[:member_id]
    goals = params[:goal]
    assists = params[:assist]
    penalties = params[:penalties]
    goal_againsts = params[:goal_against]
    shots_againsts = params[:shots_against]
    shots_on_goals = params[:shots_on_goal]
    goalie_flgs = params[:goalie_flg]
    mvp_flgs = params[:mvp_flg]
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

    #更新処理
    respond_to do |format|
      Game.transaction do
        #Game登録
        if @game.update(game_params)
          #GameMember登録
          GameMember.delete_all(['game_id = ?', @game.id])
          member_ids.each_with_index do |member_id, i|
            if member_id.present?
              @game_member = GameMember.new
              @game_member.game_id = @game.id
              @game_member.member_id = member_ids[i]
              @game_member.goal = goals[i]
              @game_member.assist = assists[i]
              @game_member.goal_against = goal_againsts[i]
              @game_member.shots_against = shots_againsts[i]
              @game_member.shots_on_goal = shots_on_goals[i]
              @game_member.penalties = penalties[i]
              @game_member.goalie_flg = goalie_flgs[i]
              unless mvp_flgs.nil?
                @game_member.mvp_flg = (mvp_flgs.key?(member_ids[i]) ? 1 : 0)
              end
              @game_member.save
            end
          end
          #Goals登録
          Goal.delete_all(['game_id = ?', @game.id])
          goal_nos.each_with_index do |goal_no, i|
            if goal_periods[i].to_i > 0
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
          end
          #Penalties登録
          GamePenalty.delete_all(['game_id = ?', @game.id])
          penalty_nos.each_with_index do |penalty_no, i|
            if penalty_periods[i].to_i > 0
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
          end
          format.html { redirect_to score_sheet_index_path(game_id:@game.id), notice: '更新成功しました。' }
        else
          format.html { redirect_to :back, notice: '更新失敗しました。' }
        end
      end
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
