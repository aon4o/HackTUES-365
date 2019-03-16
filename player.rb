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
    @y -= 10
  end

  def go_down
    @y += 10
  end

  def go_left
    @x -= 10
  end

  def go_right
    @x += 10
  end

  def draw
    @img.draw_rot(@x, @y, Zlay::PLAYER, 0)
  end
end


class Door
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y

    @img = Gosu::Image.new("na_haka_snimki/door.png")
  end

  def goto(x, y)
    @x = x
    @y = y
  end

  def draw
    @img.draw_rot(@x, @y, Zlay::DOOR, 0, center_x = 0.5, center_y = 0.5, scale_x = 0.5, scale_y = 0.5)
  end
end
