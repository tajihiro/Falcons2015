class Division < ActiveRecord::Base
  def self.last_div
    last
  end

  def self.my_div(id)
    where(id: id).last
  end
end
