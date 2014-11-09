class GameMember < ActiveRecord::Base

  #Association
  belongs_to :game
  belongs_to :member

end
