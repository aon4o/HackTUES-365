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


class Duska
  attr_accessor :drawable
  def initialize(x, y)
    @x = x
    @y = y

    @drawable = false
    @uch_img = Gosu::Image.new("na_haka_snimki/chovek_prostitutka.png")
  end

  def draw
    Gosu.draw_rect(@x, @y, 550, 400, Gosu::Color.argb(0xaf_000000), Zlay::DUSKA)
    @uch_img.draw(@x + 10, @y + 10, Zlay::ICONS)
  end
end
