class GameMember < ActiveRecord::Base
  #Association
  belongs_to :games
  belongs_to :member

  def self.game_goalies(game_id)
    where(game_id:game_id, goalie_flg: 1)
  end

  def self.game_players(game_id)
    where(game_id:game_id, goalie_flg: 0)
  end
end
