require './lib/batter'
require './lib/field'
require './lib/pitcher'
require './lib/umpire'

class Game
  attr_accessor :field, :umpire, :pitcher, :batter

  def setup_field
    self.field = Field.new
    self.umpire = Umpire.new field
    self.pitcher = Pitcher.new field
    self.batter = Batter.new field

    @field.umpire = self.umpire
    @field.pitcher = self.pitcher
    @field.batter = self.batter
  end

  def start
    @umpire.play_ball
  end

end

