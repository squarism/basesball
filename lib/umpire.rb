class Umpire
  # count, as in the pitching count
  attr_reader :count

  def initialize(field)
    @field = field
    reset_count
  end

  def reset_count
    @count = { strikes: 0, balls: 0 }
  end

  def play_ball
    pitcher.start_pitching
  end

  def pitcher
    @field.pitcher
  end

  def saw_ball_hit
    @field.advance(@field.batter)
  end

  def ready_pitcher
    self.pitcher.reset_pitching
  end

  def remove_batter
    @field.remove_player(@field.batter)
  end

  def check_strikes
    if @count[:strikes] >= 3
      remove_batter
      reset_count
    end
  end

  def check_balls
    if @count[:balls] >= 4
      @field.advance(@field.batter)
      reset_count
    end
  end

  # strike, as in three strikes and you're out
  def saw_strike
    @count[:strikes] += 1
    check_strikes
  end

  # ball, as in four balls to a walk
  def saw_ball
    @count[:balls] += 1
    check_balls
  end

end
