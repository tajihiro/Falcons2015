require 'rails_helper'
require 'spec_helper'

RSpec.describe Position, :type => :model do

  #Position
  it 'Positonは3種類' do
    position = Position.all
    expect(position.length).to eq(3)
  end
end
