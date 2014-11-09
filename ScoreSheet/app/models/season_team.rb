class SeasonTeam < ActiveRecord::Base

  #Association
  belongs_to :season
  belongs_to :division
  belongs_to :team

  def self.season_teams(season_id)
    sql = "select R.team_id team_id,
                  T.team_name team_name
             from season_teams R
             left join teams T
               on R.team_id = T.id
            where R.season_id = :season_id "
    find_by_sql([sql, season_id:season_id])
  end
end
