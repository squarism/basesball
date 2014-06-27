require './lib/umpire'

describe Umpire do

  let(:field)  { double("field") }
  let(:batter) { double("player") }

  subject do
    Umpire.new(field)
  end

  it 'tells the pitcher to pitch' do
    pitcher = double("pitcher")
    pitcher.stub(:start_pitching)
    pitcher.should_receive(:start_pitching).once

    field.stub(:pitcher) { pitcher }

    subject.play_ball
  end

  it 'sees batter hits' do
    field.stub(:advance) { }
    field.stub(:batter) { batter }
    subject.saw_ball_hit
  end

  it 'keeps track of strikes' do
    field.stub(:batter) { batter }
    subject.saw_strike

    subject.count.should == { strikes: 1, balls: 0 }
  end

  it 'keeps track of balls' do
    field.stub(:batter) { batter }
    subject.saw_ball

    subject.count.should == { strikes: 0, balls: 1 }
  end

  it 'can reset the count on next batter' do
    old_count = subject.count
    subject.reset_count

    subject.count.should == { strikes: 0, balls: 0 }
  end

  it 'keeps track of a pitching sequence' do
    field.stub(:batter) { batter }
    subject.saw_ball
    subject.saw_ball
    subject.saw_strike
    subject.saw_strike
    subject.saw_ball

    # full count!
    subject.count.should == { strikes: 2, balls: 3 }
  end

  it 'tells the batter he is out on third strike' do
    field.stub(:batter) { batter }
    field.stub(:remove_player)
    field.should_receive(:remove_player).once

    subject.saw_strike
    subject.saw_strike
    subject.saw_strike
  end

  it 'resets the count on a strike out' do
    field.stub(:batter) { batter }
    field.stub(:remove_player)

    3.times { subject.saw_strike }
    subject.count.should == { strikes: 0, balls: 0 }
  end

  it 'resets the count on a walk' do
    field.stub(:batter) { batter }
    field.stub(:advance)

    4.times { subject.saw_ball }
    subject.count.should == { strikes: 0, balls: 0 }
  end

end
