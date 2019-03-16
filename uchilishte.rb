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
  def initialize (x, y, bukva)
    @x = x
    @y = y
    @img = Gosu::Image.new("na_haka_snimki/Blue.jpg")

    @font = Gosu::Font.new(15)
    @bukva = bukva

    @clickable = false
  end

  def draw
    @img.draw_rot(@x, @y, 2, 1)
    @font.draw_text(@bukva, @x-7, @y-7, Zlay::TEXT, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
  end

end

class Duska
  attr_accessor :drawable, :option_a, :option_b, :option_c
  def initialize(x, y, image)
    @x = x
    @y = y

    @x_duska = x + 230
    @y_duska = y + 10

    @drawable = false
    @uch_img = Gosu::Image.new(image)

    @font = Gosu::Font.new(15)

    @option_a = Btn.new(@x + 310, @y + 350, "A)")
    @option_b = Btn.new(@x + 380, @y + 350, "B)")
    @option_c = Btn.new(@x + 450, @y + 350, "C)")

  end

  def goto(x, y)
    @x = x
    @y = y
  end

  def draw
    Gosu.draw_rect(@x, @y, 550, 400, Gosu::Color.argb(0xaf_000000), Zlay::DUSKA)
    Gosu.draw_rect(@x_duska, @y_duska, 300, 300, Gosu::Color.argb(0xff_ffffff), Zlay::WHITEBOARD)
    @uch_img.draw(@x + 10, @y + 10, Zlay::ICONS)

    @option_a.draw
    @option_b.draw
    @option_c.draw

    @font.draw_text("Kolko texet eho go go pet pet?", @x_duska, @y_duska, Zlay::TEXT, scale_x = 1, scale_y = 1, color = 0xff_000000, mode = :default)

  end
end
