require './lib/batter'

describe Batter do
  let(:field) { double("field") }
  let(:umpire) { double("ump") }

  subject do
    Batter.new(field)
  end

  it "has a batting chance" do
    subject.average.should_not be nil
  end

  it "can remove themselves from the field" do
    field.stub(:remove_player)

    subject.leave_field(field)
    subject.on_base?.should == false
  end

  it "creates an event when the ball is hit" do
    field.stub(:ball_hit)
    field.should_receive(:ball_hit).once

    subject.average=1.00
    subject.swing
  end

end
