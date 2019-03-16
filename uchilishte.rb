class Uchitel
  attr_accessor :x, :y
  def initialize(x, y, image)
    @x = x
    @y = y

    @img = Gosu::Image.new(image)
  end

  def goto(x, y)
    @x = x
    @y = y
  end

  def draw
    @img.draw_rot(@x, @y, Zlay::UCHITELI, 90)
  end

end


class Btn
  attr_reader :x, :y
  attr_accessor :clickable
  def initialize (x, y)
    @x = x
    @y = y
    @img = Gosu::Image.new("na_haka_snimki/Blue.jpg")

    @clickable = false
  end

  def draw
    @img.draw_rot(@x, @y, 20, 1)
  end

end


class Duska
  attr_accessor :drawable, :option_a, :option_b, :option_c
  def initialize(x, y, image)
    @x = x
    @y = y

    @drawable = false
    @uch_img = Gosu::Image.new(image)

    @option_a = Btn.new(@x + 310, @y + 350)
    @option_b = Btn.new(@x + 380, @y + 350)
    @option_c = Btn.new(@x + 450, @y + 350)

  end

  def goto(x, y)
    @x = x
    @y = y
  end

  def draw
    Gosu.draw_rect(@x, @y, 550, 400, Gosu::Color.argb(0xaf_000000), Zlay::DUSKA)
    @uch_img.draw(@x + 10, @y + 10, Zlay::ICONS)

    @option_a.draw
    @option_b.draw
    @option_c.draw
  end
end
