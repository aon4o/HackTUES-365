class Wall
  def initialize(x, y, w, h)
    @x = x
    @y = y
    @width = w
    @height = h

    @img = Gosu::Image.new("na_haka_snimki/stena_kvadrat.png")
  end

  def draw
    @img.draw_rot(@x, @y, Zlay::WALLS,  0, center_x = 0.5, center_y = 0.5, scale_x = @width, scale_y = @height)
  end

end
