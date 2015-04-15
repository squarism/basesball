require './lib/field'

describe Field do
  let(:batter) { double("batter") }
  let(:umpire) { double("umpire") }

  it "lets you put someone on first base" do
    subject.first_base=(batter)
    subject.first_base.should_not be nil
  end

  it "lets you advance all players when someone is on first" do
    walked_player = double("walked")
    subject.first_base=(walked_player)

    subject.advance(batter)
    subject.first_base.should == batter
    subject.second_base.should eq(walked_player)
  end

  it "lets you remove a player from the field" do
    subject.first_base=(batter)

    subject.remove_player(batter)
    subject.first_base.should == nil
  end

  it "has all the people needed to play" do
    [:field, :batter, :umpire].each do |person|
      subject.should.respond_to?(person)
    end
  end

  it "delivers the ball to the batter" do
    batter.stub(:swing)
    subject.stub(:batter) { batter }

    subject.deliver_ball
  end

  it "sends a crack of a bat to the field" do
    umpire.stub(:saw_ball_hit)
    umpire.should_receive(:saw_ball_hit).once
    subject.umpire = umpire

    subject.ball_hit
  end

  it "lets umpires know when a ball is missed" do
    umpire.stub(:saw_ball)
    umpire.should_receive(:saw_ball).once
    subject.umpire = umpire

    subject.ball_miss
  end


end