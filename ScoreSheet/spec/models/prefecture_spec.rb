require 'rails_helper'
require 'spec_helper'

describe 'Prefecture Model' do
  #count
  it 'Countは47都道府県' do
    prefectures = Prefecture.all
    expect(prefectures.count).to eq(47)
  end
end