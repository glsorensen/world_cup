class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def all_active_players
    active_teams = @teams.find_all {|team| !team.eliminated}
    all_active_players_ary = []
#binding.pry
    active_teams.each do |active_team|
      all_active_players_ary << active_team.players
    end
    all_active_players_ary.flatten!

  end


  def active_players_by_position(position)
    all_active_players.find_all do |active_player|
      active_player.position == position
    end

    # binding.pry
  end

  def all_positions
    all_pos_ary = all_active_players.map do |player|
      player.position
    end

    all_pos_ary.uniq!
  end

  def all_players_by_position
    new_hash = {}

    all_positions.each do |position|
      new_hash[position] = active_players_by_position(position)
binding.pry
    end

    new_hash
  end
end
