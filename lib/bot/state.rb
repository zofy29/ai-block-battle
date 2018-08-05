class State
  attr_accessor :round, :this_piece_type, :next_piece_type 
  attr_accessor :this_piece_position, :players
  attr_accessor :settings

  def this_piece_position=(this_piece_position)
    @this_piece_position = this_piece_position.split(',').map(&:to_i)
  end

  def my_player
    player(settings.your_bot)
  end

  def field
    my_player.field
  end

  def player(player_id)
    players.detect { |player| player.id == player_id }
  end
end
