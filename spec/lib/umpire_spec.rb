require './lib/umpire'

describe Umpire do

  let(:field) { double("field") }

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

end
