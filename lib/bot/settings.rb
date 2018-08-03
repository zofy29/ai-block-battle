class Settings
  attr_accessor :height, :width, :speed, :timebank, :players, :your_players

  def initialize
  end

  def set_height(height)
    @height = height
  end

  def set_width(width)
    @width = width
  end

  def set_time_move(speed)
    @speed = speed
  end

  def set_timebank(timebank)
    @timebank = timebank
  end

  def set_players(bot_player, player_2)
    @players = [bot_player, player_2]
    @your_players = bot_player
  end
end