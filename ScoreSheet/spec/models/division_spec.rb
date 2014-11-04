require 'rails_helper'
require 'spec_helper'

describe 'Division Model' do

  #---How to use RSpec -------------
  #RSpec Test 1
  it 'last_div' do
    last_division = Division.last_div
    expect(last_division.division_name).to eq("Over35")
    expect(last_division.id).to eq(11)
  end

  #RSpec Test 2
  it 'my_div' do
    bronze_division = Division.my_div(4)
    expect(bronze_division.division_name).to eq("Bronze")
    expect(bronze_division.division_en_name).to eq("Bro")
  end
  #---------------------------------
end