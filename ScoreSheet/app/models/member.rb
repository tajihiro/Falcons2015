class Member < ActiveRecord::Base
  #Securty Option
  has_secure_password

  #Association
  belongs_to :position
  has_many :season_members

  #Methods
  def member_name
    attribute('last_name') + ' ' + attribute('first_name')
  end

  def self.authenticate(email, passwd)
    where(:email => email, :password_digest => passwd).first
  end

  def self.season_member(season_id, jersey_number)
    select('members.id as id, jersey_number as jersey_number, concat(last_name," ",first_name) as member_names, positions.position_name as position_name')
        .joins(:season_members, :position)
        .where('season_members.season_id'=>season_id)
        .where(jersey_number: jersey_number).last
  end
end
