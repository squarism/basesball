# The field holds the state of the baseball game.
# It includes bases and players.

class Field
  attr_accessor :umpire, :pitcher, :batter
  attr_reader :bases


  def initialize
    @bases = [nil, nil, nil, nil]
  end

  def first_base
    @bases[0]
  end

  def first_base=(player)
    @bases[0] = player
  end

  def second_base
    @bases[1]
  end

  def second_base=(player)
    @bases[1] = player
  end

  def third_base
    @bases[2]
  end

  def third_base=(player)
    @bases[2] = player
  end

  def home=(player)
    @bases[3] = player
  end

  def advance(player)
    new_base_positions = self.bases.dup

    player_scoring = new_base_positions.pop
    if !player_scoring.nil?
      @home = player_scoring
    end
    new_base_positions.unshift player

    @bases = new_base_positions
  end

  def remove_player(player)
    position = bases.index(player)
    @bases[position] = nil
  end

  def deliver_ball
    self.batter.swing
  end

  def ball_hit
    @umpire.saw_ball_hit
  end

  def ball_miss
    @umpire.saw_ball_miss
  end

end