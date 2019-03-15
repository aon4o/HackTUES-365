require 'gosu'
load 'wall.rb'
load 'player.rb'
load 'uchilishte.rb'


module Zlay
  BACKGROUND = 0
  WALLS = 1
  UCHITELI = 2
  PLAYER = 3
  DUSKA = 5
  CURSOR = 10
end

class Chin
  def initialize(x, y, w, h)
    @x = x
    @y = y
    @width = w
    @height = h
  end

  def draw
    Gosu.draw_rect(@x, @y, @width, @height, Zlay::Uchiteli, Gosu::Color(0xff_ff00ff))
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

    @zhana = Uchitel.new(-900, -900, "na_haka_snimki/janet.png")
    @duska_zhana = Duska.new(200, 30)

    @upper_rect = Chin.new()
    @middle_rect = Chin.new()
    @lower_rect = Chin.new()

  end


  def update
    @igrach.go_left if Gosu.button_down? Gosu::KB_A
    @igrach.go_right if Gosu.button_down? Gosu::KB_D
    @igrach.go_down if Gosu.button_down? Gosu::KB_S
    @igrach.go_up if Gosu.button_down? Gosu::KB_W



    @igrach.y = self.height - 30 if @igrach.y > self.height - 30 && @bg_counter != 3 && @bg_counter != 4 && @bg_counter != 5


    case @bg_counter
    when -1 # =================================
      @background = Gosu::Image.new("na_haka_snimki/yellow_back.png")

      if @igrach.x > self.width - 30
        @bg_counter = 0
        @igrach.x = 30
      end

      if @igrach.y < 0
        @bg_counter = 5
        @igrach.y = self.height - 50
      end

      @igrach.x = 30 if @igrach.x < 30

    when 0 # =================================
      @background = Gosu::Image.new("na_haka_snimki/grey_back.png")

      if @igrach.x > self.width
        @bg_counter = 1
        @igrach.x = 30
      end

      if @igrach.x < 0
        @bg_counter = -1
        @igrach.x = self.width - 30
      end

      if @igrach.y < 0
        @bg_counter = 4
        @igrach.y = self.height - 40
      end

    when 1 # =================================
      @background = Gosu::Image.new("na_haka_snimki/red_back.png")

      if @igrach.y < 30
        @bg_counter = 3
        @igrach.y = self.height - 30
      end

      if @igrach.x < 0
        @bg_counter = 0
        @igrach.x = self.width - 30
      end

      if @igrach.x > self.width
        @bg_counter = 2
        @igrach.x = 30
      end

    when 2 # =================================
      @background = Gosu::Image.new("na_haka_snimki/black_back.png")

      @igrach.y = 30 if @igrach.y < 30

      if @igrach.x < 0
        @bg_counter = 1
        @igrach.x = self.width - 30
      end

      @igrach.x = self.width - 30 if @igrach.x > self.width - 30

    when (3..5) # =================================
      @background = Gosu::Image.new("na_haka_snimki/staq.png")
      @igrach.x = 50 if @igrach.x < 50
      @igrach.x = self.width - 50 if @igrach.x > self.width - 50
      @igrach.y = 40 if @igrach.y < 40

      if @igrach.y > self.height-30
        @bg_counter = 1
        @igrach.y = 30
      end

    end


    @bg_counter == 1 ? @zhana.goto(100, 130) : @zhana.goto(-900, -900)
    Gosu.distance(@igrach.x, @igrach.y, @zhana.x, @zhana.y) < 75 ? @duska_zhana.drawable = true : @duska_zhana.drawable = false

end

  def draw
    @background.draw(0, 0, Zlay::BACKGROUND)
    @cursor.draw(self.mouse_x, self.mouse_y, Zlay::CURSOR)
    @walls.each{|wall| wall.draw}
    @igrach.draw

    @zhana.draw
    @duska_zhana.draw if @duska_zhana.drawable
  end

end

TheGame.new.show
