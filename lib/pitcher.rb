require 'finite_machine'

class Pitcher
  attr_reader :field

  def initialize(field)
    @field = field
  end

  # pitcher states
  # :ready --> :pitching --> :pitched
  def pitching
    # scope for inside of FiniteMachine
    context = self

    @pitching ||= FiniteMachine.define do
      # initial state
      initial :ready

      # use stored scope
      target context

      # states
      events {
        event :pitch, :ready   => :pitched
        event :reset, :pitched => :ready
      }

      # hooks
      callbacks {
        on_after(:pitch) do |event|
          self.field.deliver_ball
        end
      }

    end
  end

  def start_pitching
    pitching.pitch
  end

  def reset_pitching
    pitching.reset
  end

end
