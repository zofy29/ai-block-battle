class Player
  attr_accessor :id, :row_points, :combo, :skips
  attr_accessor :field

  def initialize(id)
    @id = id
  end

  def field=(raw_field)
    @field = raw_field.split(";").map { |a| a.split(",") }
  end
end
