require 'gosu'

module Zlay
  BACKGROUND = 0
  CURSOR = 10
end



class TheGame < Gosu::Window
  def initialize
    super 640, 480

    @background = Gosu::Image.new("na_haka_snimki/grey_back.png")
    @cursor = Gosu::Image.new("na_haka_snimki/cursor.png")
  end


  def update
    #...
  end

  def draw
    @background.draw(0, 0, Zlay::BACKGROUND)
    @cursor.draw(self.mouse_x, self.mouse_y, Zlay::CURSOR)
  end

end

TheGame.new.show
