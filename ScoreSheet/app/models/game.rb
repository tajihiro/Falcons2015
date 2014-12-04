class Game < ActiveRecord::Base
  #Association
  belongs_to :season
  belongs_to :division
  belongs_to :game_type

  belongs_to :team
  belongs_to :home_team, class_name:Team, foreign_key:'home_team_id'
  belongs_to :away_team, class_name:Team, foreign_key:'away_team_id'

  has_many :game_members
  has_many :member, through:'game_members'
  has_many :goals
  has_many :penalties, through:'game_penalties'


  #Method
  def self.selected_game(season_id, id)
    if season_id.nil? && id.nil?
      selected_game = all.order(:game_date,:game_time).last
    elsif season_id.nil? && id.present?
      selected_game = find(id)
    elsif season_id.present? && id.nil?
      selected_game = where(season_id:season_id).order(:game_date,:game_time).last
    else
      selected_game = where(season_id:season_id, id:id).order(:game_date,:game_time).last
    end
    selected_game.nil? ? all.order(:game_date,:game_time).last : selected_game
  end

  def self.games_navi(season_id)
    where(season_id:season_id).order(:game_date,:game_time)
  end

end
