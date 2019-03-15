require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "TUES: The Game"
    @background_image = Gosu::Image.new("na_haka_snimki/backgd.png")
    @cursor = Gosu::Image.new("na_haka_snimki/cursor.png")
    @menu = Gosu::Image.new("na_haka_snimki/menu_btn.png")
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    # ...
  end

  def draw
    @background_image.draw(0,0,0)
    @cursor.draw(self.mouse_x, self.mouse_y, 10)
    @menu.draw_rot(150,450,2,0,0.5,0.5,0.1,0.1)
    @font.draw("QUESTION HERE", 420, 50, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @font.draw("a)", 420, 70, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @font.draw("b)", 420, 90, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @font.draw("c)", 420, 110, 1, 1.0, 1.0, Gosu::Color::BLACK)

  end
end

Tutorial.new.show
