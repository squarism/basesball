class Umpire

  def initialize(field)
    @field = field
  end

  def play_ball
    self.pitcher.start_pitching
  end

  def pitcher
    @field.pitcher
  end

end
