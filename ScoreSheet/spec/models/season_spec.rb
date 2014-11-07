require 'rails_helper'
require 'spec_helper'

describe 'Season Model' do
  #count
  it 'Seasonは32シーズン' do
    seasons = Season.all
    expect(seasons.count).to eq(32)
  end

  #selected_season
  it 'selected_season(id) id is nil' do
    selected_season = Season.selected_season(nil)
    expect(selected_season.id).to eq(32)
  end

  it 'selected_season(id) 30' do
    selected_season = Season.selected_season(30)
    expect(selected_season.id).to eq(30)
  end


  #seasons_menu
  it 'seasons_menu' do
    season_menu = Season.seasons_menu
    expect(season_menu.count).to eq(4)
  end

end