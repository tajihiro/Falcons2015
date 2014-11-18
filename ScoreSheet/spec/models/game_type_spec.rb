require 'rails_helper'

RSpec.describe GameType, :type => :model do
  #GameType
  it 'GameTypeは2種類' do
    game_type = GameType.all
    expect(game_type.length).to eq(2)
  end
end
