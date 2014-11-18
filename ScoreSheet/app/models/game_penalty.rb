class GamePenalty < ActiveRecord::Base
  #Association
  belongs_to :game
  belongs_to :penalty
  belongs_to :member, class_name:Member, foreign_key:'penalty_member_id'

  def self.details(game_id)
    where(game_id: game_id).order('period, penalty_min, penalty_sec')
  end

end
