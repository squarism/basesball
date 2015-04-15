# this is the concept of a game

require './lib/game'

# no mocks, this is an integration test class
describe Game do

  subject do
    game = Game.new
    game.setup_field
    game
  end

  it "runs a quick inning" do
    subject.field.batter.should_receive(:swing).twice
    subject.umpire.play_ball
    subject.pitcher.reset_pitching
    subject.umpire.play_ball
    # require 'pry'; binding.pry
  end

end

