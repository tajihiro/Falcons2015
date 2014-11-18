require 'rails_helper'
require 'spec_helper'

RSpec.describe Member, :type => :model do

  #member_name
  it 'member_nameで last_name + first_name を返す' do
    tajima = Member.find(2)

    expect(tajima.member_name).to eq('田島 啓之')
  end
end
