class Command
  ACTIONS = %w(left right down turnleft turnright).freeze

  def left(step = 1)
    puts (['left'] * step).join(',')
  end

  def right(step = 1)
    puts (['right'] * step).join(',')
  end

  def down
    puts :down
  end

  def turn_left
    puts :turnleft
  end

  def turn_right
    puts :turnright
  end

  def random
    puts ACTIONS.sample(Random.rand(1..5)).join(",")
  end
end