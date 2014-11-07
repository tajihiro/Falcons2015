require 'rails_helper'
require 'spec_helper'

describe 'Game Model' do
  #selected_game
  it 'selected_gameのパラメータ(season_id, game_id)' do
    selected_game = Game.selected_game(28, 10)
    expect(selected_game.id).to eq(10)
    expect(selected_game.game_name).to eq('final')
  end

  it 'selected_gameのパラメータ(season_id, game_id)がnil,nil' do
    selected_game = Game.selected_game(nil, nil)
    expect(selected_game.game_name).to eq('final')
  end

  it 'selected_gameのパラメータ(season_id)がnil' do
    selected_game = Game.selected_game(nil, 10)
    expect(selected_game.season_id).to eq(28)
    expect(selected_game.id).to eq(10)
  end

  it 'selected_gameのパラメータ(game_id)がnil' do
    selected_game = Game.selected_game(28, nil)
    expect(selected_game.id).to eq(10)
  end

  #games_navi
  it 'games_naviのパラメータ(season_id)が28' do
    game_navi = Game.games_navi(28)
    expect(game_navi.count).to eq(11)
  end
end