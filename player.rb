class Player
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @i = 0
    @img = Gosu::Image.new("na_haka_snimki/pl_d.png")
    @player_anim
  end

  def goto(x, y)
    @x = x
    @y = y
  end

  def go_up
    @y -= 10
    @i = 1
  end

  def go_down
    @y += 10
    @i = 2
  end

  def go_left
    @x -= 10
    @i = 3
  end

  def go_right
    @x += 10
    @i = 4
  end

  def still
    @i = 0
  end

  def draw

  case @i
  when 0
    @img.draw_rot(@x, @y, Zlay::PLAYER, 0)
  when 1
    @player_anim = Gosu::Image.load_tiles("na_haka_snimki/pl_ua.png", 76, 62)
    player = @player_anim[Gosu.milliseconds/100 % @player_anim.size]
    player.draw_rot(@x, @y, Zlay::PLAYER, 0)
  when 2
    @player_anim = Gosu::Image.load_tiles("na_haka_snimki/pl_da.png", 76, 62)
    player = @player_anim[Gosu.milliseconds/100 % @player_anim.size]
    player.draw_rot(@x, @y, Zlay::PLAYER, 0)
  when 3
    @player_anim = Gosu::Image.load_tiles("na_haka_snimki/pl_la.png", 76, 62)
    player = @player_anim[Gosu.milliseconds/100 % @player_anim.size]
    player.draw_rot(@x, @y, Zlay::PLAYER, 0)
  when 4
    @player_anim = Gosu::Image.load_tiles("na_haka_snimki/pl_ra.png", 76, 62)
    player = @player_anim[Gosu.milliseconds/100 % @player_anim.size]
    player.draw_rot(@x, @y, Zlay::PLAYER, 0)
  end
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

=begin


=end
