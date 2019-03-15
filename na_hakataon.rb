require 'gosu'

module Zlay
  BACKGROUND = 0
  WALLS = 1
  CURSOR = 10
end


class Wall
  def initialize(x, y, w, h)
    @x = x
    @y = y
    @width = w
    @height = h

    @img = Gosu::Image.new("na_haka_snimki/stena_kvadrat.png")
  end

  def draw
    @img.draw_rot(@x, @y, Zlay::WALLS,  0, center_x = 0.5, center_y = 0.5, scale_x = @width, scale_y = @height)
  end

end


class TheGame < Gosu::Window
  def initialize
    super 640, 480

    @background = Gosu::Image.new("na_haka_snimki/grey_back.png")
    @cursor = Gosu::Image.new("na_haka_snimki/cursor.png")

    @walls = [Wall.new(0, self.height/2, 0.5, 5),
      Wall.new(self.width/2, 0, 7, 0.5),
      Wall.new(self.width, self.height/2, 0.5, 5),
      Wall.new(self.width/2, self.height, 7, 0.5)]

  end


  def update
    #...
  end

  def draw
    @background.draw(0, 0, Zlay::BACKGROUND)
    @cursor.draw(self.mouse_x, self.mouse_y, Zlay::CURSOR)
    @walls.each{|wall| wall.draw}
  end

end

TheGame.new.show
