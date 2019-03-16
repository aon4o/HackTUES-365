require 'gosu'

class Btn
  attr_reader :x, :y
  def initialize (x, y)
    @x = x
    @y = y
    @img = Gosu::Image.new("na_haka_snimki/Blue.jpg")
  end
  def draw
    @img.draw_rot(@x, @y, 20, 1)
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
    @option_a = Btn.new(265, 405)
  end

  def update
    if (Gosu.distance(@option_a.x, @option_a.y, mouse_x, mouse_y) < 20 && button_down?(Gosu::MsLeft))
      puts("you cklicked a")
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
    @option_a.draw
  end
end


Tutorial.new.show
