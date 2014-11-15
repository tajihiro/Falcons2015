class GameMember < ActiveRecord::Base
  #Association
  belongs_to :game
  belongs_to :member

  def self.game_goalies(game_id)
    sql = "select concat(M.last_name, ' ',M.first_name) goalie_name,
                  M.jersey_number jersey_number,
                  P.position_name position_name,
                  S.member_id member_id,
                  S.goal_against goal_against,
                  S.shots_against shots_against,
                  S.penalties penalties,
                  S.mvp_flg,
                  S.goalie_flg
             from game_members S
             left join members M
               on S.member_id = M.id
             left join games G
               on S.game_id = G.id
             left join positions P
               on M.position_id = P.id
            where G.id = :game_id
              and S.goalie_flg = 1 "
    find_by_sql([sql,{game_id:game_id}])
  end

  def self.game_players(game_id)
    sql = "select concat(M.last_name, ' ',M.first_name) player_name,
                  M.jersey_number jersey_number,
                  P.position_name position_name,
                  S.member_id member_id,
                  S.goal goal,
                  S.assist assist,
                  (S.goal + S.assist) point,
                  S.penalties penalties,
                  S.mvp_flg,
                  S.goalie_flg
             from game_members S
             left join members M
               on S.member_id = M.id
             left join games G
               on S.game_id = G.id
             left join positions P
               on M.position_id = P.id
            where G.id = :game_id
              and S.goalie_flg <> 1
            order by (S.goal + S.assist) DESC"
    find_by_sql([sql,{game_id:game_id}])
  end


end
