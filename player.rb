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
    @y -= 8
  end

  def go_down
    @y += 8
  end

  def go_left
    @x -= 8
  end

  def go_right
    @x += 8
  end
  def draw
    player = @player_anim[Gosu.milliseconds/100%@player_anim.size]
    player.draw_rot(@x, @y, Zlay::PLAYER, 0)
  end
end
