require './lib/pitcher'

describe Pitcher do

  let(:field)  { double("field") }
  let(:umpire) { double("ump") }
  let(:batter) { double("batter") }

  subject do
    Pitcher.new(field)
  end

  it 'delivers the ball to the field and the batter notices the pitch' do
    field.stub(:deliver_ball) { batter.swing }
    batter.stub(:swing)
    batter.should_receive(:swing).once

    subject.pitching.pitch
  end

end
