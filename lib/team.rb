require './lib/player'

class Team
  attr_reader :name, :city, :roster, :player_count

  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
    @player_count = 0
  end

  def add_player(player)
    @roster << player
    @player_count += 1
  end

  def long_term_players
    arr = []
    @roster.each do |player|
      if player.contract_length > 24
        arr << player
      end
    end
    arr
  end

  def short_term_players
    arr = []
    @roster.each do |player|
      if player.contract_length <= 24
        arr << player
      end
    end
    arr
  end

  def total_value
    total = 0
    @roster.each do |player|
      total += player.total_cost
    end
    total
  end

  def details
    {"total_value" => total_value,
    "player_count" => player_count}
  end
end