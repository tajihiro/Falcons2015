require 'rails_helper'
require 'spec_helper'

RSpec.describe Goal, :type => :model do
  it 'details' do
    details = Goal.details(6)
    expect(details).to_not be_nil
  end
end
