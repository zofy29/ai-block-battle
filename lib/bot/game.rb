class Game
  attr_accessor :settings, :state, :action
  def initialize(settings, current_state)
    @settings = settings
    @state = current_state
    @action = Command.new
  end

  def caculate_next_action
    case @state.current_type.first
    when I
      @action.random
    when J
      @action.random
    when L
      @action.random
    when O
      @action.random
    when S
      @action.random
    when T
      @action.random
    when Z
      @action.random
    end
  end
end