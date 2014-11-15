require 'rails_helper'
require 'spec_helper'

describe 'Game Model' do
  #selected_game
  it 'selected_game(season_id=nil, id=nil)でも最終のGameを返す' do
    game = Game.selected_game(nil, nil)
    expect(game).to_not be_nil
    expect(game.game_name).to eq('final')
  end

  it 'selected_game(season_id=30, id=nil)でも最終のGameを返す' do
    game = Game.selected_game(30, nil)
    expect(game).to_not be_nil
    expect(game.game_name).to eq('final')
  end

  it 'selected_game(season_id=30, id=10)の場合game_id=10を返す' do
    game = Game.selected_game(30, 10)
    expect(game).to_not be_nil
    expect(game.game_name).to eq('final')
  end

  #games_navi
  it 'games_naviのパラメータ(season_id)が28' do
    game_navi = Game.games_navi(28)
    expect(game_navi.count).to eq(11)
  end
end