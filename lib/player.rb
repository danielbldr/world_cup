class Player
  attr_reader :name, :position
  
  def initialize(player_info)
    @name = player_info[:name]
    @position = player_info[:position]
  end
end
