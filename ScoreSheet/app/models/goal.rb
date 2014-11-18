class Goal < ActiveRecord::Base
  #Association
  belongs_to :goal_member, class_name:Member, foreign_key:'goal_member_id'
  belongs_to :assist1_member, class_name:Member, foreign_key:'assist1_member_id'
  belongs_to :assist2_member, class_name:Member, foreign_key:'assist2_member_id'


  def self.details(game_id)
    where(game_id: game_id).order('period, goal_min, goal_sec')
  end

end
