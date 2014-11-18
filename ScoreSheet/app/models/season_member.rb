class SeasonMember < ActiveRecord::Base
  #Association
  belongs_to :season
  belongs_to :division
  belongs_to :member

  def self.season_goalies(season_id)
    # joins(Member).where(season_id:season_id, position_id:3)
    sql = "select *
             from season_members S
             left join members M
               on S.member_id = M.id
            where M.position_id = 3
              and S.season_id = :season_id"
    find_by_sql([sql,{season_id:season_id}])
  end

  def self.season_players(season_id)
#    joins(Member).where(season_id:season_id).where.not(position_id:3)
    sql = "select *
             from season_members S
             left join members M
               on S.member_id = M.id
            where M.position_id <> 3
              and S.season_id = :season_id"
    find_by_sql([sql,{season_id:season_id}])
  end


end
