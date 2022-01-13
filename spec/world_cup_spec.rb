require './lib/world_cup'
require './lib/team'
require './lib/player'
require 'pry'

RSpec.describe  WorldCup do
  before(:each) do
    @france = Team.new("France")
    @croatia = Team.new("Croatia")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})

    @france.add_player(@mbappe)
    @france.add_player(@pogba)

    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  it 'exists' do

    expect(@world_cup).to be_a WorldCup
  end

  it 'has a year' do

    expect(@world_cup.year).to eq 2018
  end

  it 'has teams' do

    expect(@world_cup.teams).to eq [@france, @croatia]
  end

  it 'can call players by position' do

    expect(@world_cup.active_players_by_position("midfielder")).to eq [@pogba, @modric]
  end

  it 'can call only players that have not been eliminated' do
    @croatia.eliminated = true

    expect(@world_cup.active_players_by_position("midfielder")).to eq [@pogba]
  end

  it 'can pull all positions' do


    expect(@world_cup.all_positions).to eq ["forward", "midfielder", "defender"]
  end

  it 'can hash the player to the position' do
    expected = {
      "forward" =>[@mbappe],
      "midfielder" => [@pogba, @modric],
      "defender" => [@vida]
    }

    expect(@world_cup.all_players_by_position).to eq expected
  end
end
