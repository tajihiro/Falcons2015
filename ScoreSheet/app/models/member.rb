class Member < ActiveRecord::Base
  #Association
  belongs_to :position

  def member_name
    attribute('last_name') + ' ' + attribute('first_name')
  end
end
