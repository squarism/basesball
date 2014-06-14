# Let's practice CRC cards and design by making baseball

require './lib/batter'
require './lib/field'
require './lib/pitcher'
require './lib/umpire'

class Game
  attr_accessor :field, :ump, :pitcher, :batter

  def setup_field
    self.field = Field.new
    self.ump = Umpire.new field
    self.pitcher = Pitcher.new field
    self.batter = Batter.new field

    @field.umpire = self.ump
    @field.pitcher = self.pitcher
    @field.batter = self.batter
  end

  def start
    self.ump.play_ball
  end

end

game = Game.new
game.setup_field
game.start
require 'pry'; binding.pry
