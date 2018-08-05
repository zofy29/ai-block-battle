class State
  attr_accessor :map, :current_type, :next_type, :current_type_start

  def parse_map
    map.reverse.split(";")
  end

  def convert_to_matrix
    parse_map.split(";").map{ |x| x.split(",").map(&:to_i) }
  end

  def current_score
    map = parse_map
    score = 0
    convert_to_matrix.each_with_index do |row, index|
      score += index * (row.reduce(&:+))
    end

    score
  end
end