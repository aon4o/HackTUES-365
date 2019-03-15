require 'gosu'

class Btn
  attr_reader :x, :y
  def initialize (x, y)
    @x = x
    @y = y
    @img = Gosu::Image.new("na_haka_snimki/Blue.jpg")
  end
  def draw
    @img.draw(@x, @y, 5, 1)
  end
end



class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "TUES: The Game"
    #@background_image = Gosu::Image.new("na_haka_snimki/backgd.png")
    @cursor = Gosu::Image.new("na_haka_snimki/cursor.png")
    @menu = Gosu::Image.new("na_haka_snimki/menu_btn.png")
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @dyska = Gosu::Image.new("na_haka_snimki/dyska.png")
    @btns_back = Gosu::Image.new("na_haka_snimki/btns_back.png")
    @opt_a = Btn.new(220,390)
    @opt_b = Btn.new(320,390)
    @opt_c = Btn.new(420,390)
  end

  def update
    if (Gosu.distance(@opt_a.x, @opt_a.y, mouse_x, mouse_y) < 15 && button_down?(Gosu::MsLeft))
      puts("you cklicked opt a")
    end
    if (Gosu.distance(@opt_b.x, @opt_b.y, mouse_x, mouse_y) < 15 && button_down?(Gosu::MsLeft))
      puts("you cklicked opt b")
    end
    if (Gosu.distance(@opt_c.x, @opt_c.y, mouse_x, mouse_y) < 15 && button_down?(Gosu::MsLeft))
      puts("you cklicked opt c")
    end
  end

  def draw
    #@background_image.draw(0,0,0)
    @cursor.draw(self.mouse_x, self.mouse_y, 10)
    @menu.draw_rot(150,450,2,0,0.5,0.5,0.1,0.1)
    @font.draw("QUESTION HERE", 210, 30, 5, 3, 3, Gosu::Color::BLACK)
    @font.draw("a)", 210, 90, 5, 2, 2, Gosu::Color::BLACK)
    @font.draw("b)", 210, 130, 5, 2, 2, Gosu::Color::BLACK)
    @font.draw("c)", 210, 170, 5, 2, 2, Gosu::Color::BLACK)
    @dyska.draw(200,20,3, 0.7, 0.7)
    @btns_back.draw(200,370,3, 1.2, 1.7)
    @opt_a.draw
    @opt_b.draw
    @opt_c.draw
  end
end


Tutorial.new.show
