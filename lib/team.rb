class Team

  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @elimintated
  end

  def add_player(name)
    @players << name
  end

  def players_by_position(position)
    @players.find_all do |player|
      player.position == position
    end
  end
end
