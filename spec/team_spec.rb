require './lib/team'
require './lib/player'
require 'pry'

RSpec.describe  Team do
  before(:each) do
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

  end

  it 'exists' do

    expect(@team).to be_a(Team)
  end

  it 'has a country' do

    expect(@team.country).to eq("France")
  end

  it 'is not eliminated by default' do

     expect(@team.eliminated).to be false

  end

  it 'can be eliminated' do

    @team.eliminated = true

     expect(@team.eliminated).to be true

  end

  it 'has no players by default' do

     expect(@team.players).to eq([])

  end

  it 'can add players' do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

     expect(@team.players).to eq([@mbappe, @pogba])

  end

  it 'can call players by position' do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

     expect(@team.players_by_position("midfielder")).to eq([@pogba])

  end
end
