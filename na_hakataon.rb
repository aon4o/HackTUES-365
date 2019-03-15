require 'gosu'
load 'wall.rb'
load 'player.rb'

module Zlay
  BACKGROUND = 0
  WALLS = 1
  PLAYER = 2
  CURSOR = 10
end


class TheGame < Gosu::Window
  def initialize
    super 640, 480

    @background
    @bg_counter = 0
    @cursor = Gosu::Image.new("na_haka_snimki/cursor.png")

    @walls = [Wall.new(0, self.height/2, 0.3, 5),
      Wall.new(self.width/2, 0, 7, 0.3),
      Wall.new(self.width, self.height/2, 0.3, 5),
      Wall.new(self.width/2, self.height, 7, 0.3)]

    @igrach = Player.new(self.width/2, self.height/2)

  end


  def update
    @igrach.go_left if Gosu.button_down? Gosu::KB_A
    @igrach.go_right if Gosu.button_down? Gosu::KB_D
    @igrach.go_down if Gosu.button_down? Gosu::KB_S
    @igrach.go_up if Gosu.button_down? Gosu::KB_W


    @igrach.x = 30 if @igrach.x < 30 && (@igrach.y < 50 || @igrach.y > 100)
    @igrach.y = 30 if @igrach.y < 30
    @igrach.x = self.width-30 if @igrach.x > self.width-30 && (@igrach.y < 50 || @igrach.y > 100)
    @igrach.y = self.height-30 if @igrach.y > self.height-30



    case @bg_counter
    when -1
      @background = Gosu::Image.new("na_haka_snimki/red_back.png")
      if @igrach.x < 0
          @bg_counter += 1
          @igrach.goto(self.width, @igrach.y)
      end
      if @igrach.x > self.width
        @bg_counter -= 1
        @igrach.x = 0
      end
    when 0
      @background = Gosu::Image.new("na_haka_snimki/grey_back.png")
      if @igrach.x < 0
          @bg_counter = 1
          @igrach.goto(self.width, @igrach.y)
      end
      if @igrach.x > self.width
        @bg_counter = -1
        @igrach.x = 0
      end
    when 1
      @background = Gosu::Image.new("na_haka_snimki/yellow_back.png")
      if @igrach.x < 0
          @bg_counter += 1
          @igrach.goto(self.width, @igrach.y)
      end
      if @igrach.x > self.width
        @bg_counter -= 1
        @igrach.x = 0
      end
    end
  end

  def draw
    @background.draw(0, 0, Zlay::BACKGROUND)
    @cursor.draw(self.mouse_x, self.mouse_y, Zlay::CURSOR)
    @walls.each{|wall| wall.draw}
    @igrach.draw
  end

end

TheGame.new.show
