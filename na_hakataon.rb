require 'gosu'
load 'wall.rb'
load 'player.rb'

module Zlay
  BACKGROUND = 0
  WALLS = 1
  UCHITELI = 2
  PLAYER = 3
  CURSOR = 10
end


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
    @img.draw_rot(@x, @y, Zlay::UCHITELI, 0)
  end

end


class TheGame < Gosu::Window
  def initialize
    super 640, 480

    @background
    @bg_counter = 2
    @cursor = Gosu::Image.new("na_haka_snimki/cursor.png")

    @walls = [Wall.new(0, self.height/2, 0.3, 5),
      Wall.new(self.width/2, 0, 7, 0.3),
      Wall.new(self.width, self.height/2, 0.3, 5),
      Wall.new(self.width/2, self.height, 7, 0.3)]

    @igrach = Player.new(self.width/2, self.height/2)

    @zhana = Uchitel.new(100, 200, "na_haka_snimki/janet.png")

  end


  def update
    @igrach.go_left if Gosu.button_down? Gosu::KB_A
    @igrach.go_right if Gosu.button_down? Gosu::KB_D
    @igrach.go_down if Gosu.button_down? Gosu::KB_S
    @igrach.go_up if Gosu.button_down? Gosu::KB_W

    @igrach.y = 30 if @igrach.y < 30
    @igrach.y = self.height - 30 if @igrach.y > self.height - 30

    case @bg_counter
    when -1
      @background = Gosu::Image.new("na_haka_snimki/yellow_back.png")

      if @igrach.x > self.width - 30
        @bg_counter += 1
        @igrach.x = 30
      end

      @igrach.x = 30 if @igrach.x < 30
    when 0
      @background = Gosu::Image.new("na_haka_snimki/grey_back.png")

      if @igrach.x > self.width
        @bg_counter += 1
        @igrach.x = 30
      end

      if @igrach.x < 0
        @bg_counter -= 1
        @igrach.x = self.width - 30
      end
    when 1
      @background = Gosu::Image.new("na_haka_snimki/red_back.png")

      if @igrach.x < 0
        @bg_counter -= 1
        @igrach.x = self.width - 30
      end

      if @igrach.x > self.width
        @bg_counter += 1
        @igrach.x = 30
      end

    when 2
      @background = Gosu::Image.new("na_haka_snimki/black_back.png")

      if @igrach.x < 0
        @bg_counter -= 1
        @igrach.x = self.width - 30
      end

      @igrach.x = self.width - 30 if @igrach.x > self.width - 30
    end
end

  def draw
    @background.draw(0, 0, Zlay::BACKGROUND)
    @cursor.draw(self.mouse_x, self.mouse_y, Zlay::CURSOR)
    @walls.each{|wall| wall.draw}
    @igrach.draw
    @zhana.draw
  end

end

TheGame.new.show
