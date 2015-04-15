class Batter
  attr_accessor :average

  def initialize(field)
    @field = field
    @on_base = false
    @average = rand(0.125 .. 0.500)
  end

  def swing
    hit = rand < self.average
    notify_field_of_hit(hit)
  end

  def leave_field(field)
    field.remove_player(self)
    @on_base = false
  end

  def on_base?
    @on_base == true
  end

  def notify_field_of_hit(hit)
    if hit
      @field.ball_hit
    else
      @field.ball_miss
    end
  end

end