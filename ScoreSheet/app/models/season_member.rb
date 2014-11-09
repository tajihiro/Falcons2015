class SeasonMember < ActiveRecord::Base
  #Association
  belongs_to :season
  belongs_to :division
  belongs_to :member
end
