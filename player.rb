class Player
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @img = Gosu::Image.new("na_haka_snimki/Red.jpg")
    @player_anim = Gosu::Image.load_tiles("na_haka_snimki/4avek_nadqsno.png", 76, 62)
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
    player = @player_anim[Gosu.milliseconds/100%@player_anim.size]
    player.draw_rot(@x, @y, Zlay::PLAYER, 0)
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
