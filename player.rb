class Player
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @img = Gosu::Image.new("na_haka_snimki/Red.jpg")
  end

  def goto(x, y)
    @x = x
    @y = y
  end

  def go_up
    @y -= 3
  end

  def go_down
    @y += 3
  end

  def go_left
    @x -= 3
  end

  def go_right
    @x += 3
  end

  def draw
    @img.draw_rot(@x, @y, Zlay::PLAYER, 0)
  end
end
