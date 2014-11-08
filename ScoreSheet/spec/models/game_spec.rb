require 'rails_helper'
require 'spec_helper'

describe 'Game Model' do
  #games_navi
  it 'games_naviのパラメータ(season_id)が28' do
    game_navi = Game.games_navi(28)
    expect(game_navi.count).to eq(11)
  end
end