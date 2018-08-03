class State
  attr_accessor :map, :current_type, :next_type, :current_type_start

  def parse_map
    map.reverse.split(";")
  end
end