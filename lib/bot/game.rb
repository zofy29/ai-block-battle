class Game
  attr_accessor :state, :action

  def initialize(current_state)
    @state = current_state
    @action = Command.new
  end

  def caculate_next_action
    target = best_target(@state.field, @state.this_piece_type)
    return @action.left if target.nil?

    steps = @state.this_piece_position.first - target[:start]

    if steps > 0
      @action.left(steps.abs)
    else
      @action.right(steps.abs)
    end
  end

  private

  def best_target(field, this_piece_type)
    results = []
    field.transpose.each_with_index do |cells, row|
      result = [@state.settings.field_height.to_i - 1, row]
      cells.each_with_index do |value, cell_index|
        if %(2 3).include?(value)
          result = [cell_index - 1, row]
          break
        end
      end
      results << result
    end
    min = Module.const_get("Piece::#{this_piece_type}").matrix.first.length
    targets = available_targets(results)
    targets.select { |a| a[:num] >= min }.sort_by { |a| a[:row] }.last
  end

  def available_targets(results)
    current = { row: results[0][0], num: 0, start: results[0][1] }
    targets = [current]

    results.each do |result|
      if current[:row] == result[0]
        current[:num] += 1
      else
        current = { row: result[0], num: 1, start: result[1] }
        targets << current
      end
    end
    targets
  end
end