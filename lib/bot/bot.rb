class Bot
  attr_accessor :formatter, :state, :settings

  def initialize
    @state = State.new
    @formatter = Formatter.new
    @settings = Settings.new
  end

  def run
    while (line = gets) # reads lines from stdin
      line.chomp == '' || parse(line.chomp) # parses each non-empty line
    end
    run # re-launches listener
  end

  private

  def parse(line)
    formatted_line = @formatter.format_input(line)
    case formatted_line.shift
    when 'action'
      game = Game.new(@settings, @state)
      game.caculate_next_action
    when 'settings'
      update_setting(formatted_line)
    when 'update'
      update_case(formatted_line)
    when 'quit'
      exit(true) # stops running if 'quit'
    end
  end

  def update_setting(formatted_line)
    case formatted_line.shift
    when 'your_bot'
      @settings.your_players = formatted_line
    when 'field_height'
      @settings.set_height(formatted_line)
    when 'field_width'
      @settings.set_width(formatted_line)
    when 'player_names'
      @settings.set_players(formatted_line[0], formatted_line[1])
    when 'timebank'
      @settings.set_timebank(formatted_line)
    when 'time_per_move'
      @settings.set_time_move(formatted_line)
    end
  end

  def update_case(formatted_line)
    case formatted_line.shift
    when 'game'
      update_game(formatted_line)
    when @settings.your_players
      @state.map = formatted_line if formatted_line.shift == 'field'
    end

  end

  def update_game(formatted_line)
    case formatted_line.shift
    when 'this_piece_type'
      @state.current_type = formatted_line
    when 'next_piece_type'
      @state.next_type = formatted_line
    when 'this_piece_position'
      @state.current_type_start = formatted_line
    end
  end
end
