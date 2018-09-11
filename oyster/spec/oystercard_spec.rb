require 'oystercard'

describe Oystercard do

  it "the balance should be 0 by default" do
    expect(subject.balance).to eq 0
  end

  it "when we top up £10, add to balance" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "raises error when balance + top up amounts to a set limit" do
    allow(subject).to receive(:balance) {Oystercard::MAXIMUM}
    expect{subject.top_up(1)}.to raise_error ('Unable to top up,maximum #{Oystercard::MAXIMUM} reached')
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it "should deduct money from balance when used" do
    expect {subject.deduct(1)}.to change{subject.balance}.by(-1)
  end

  it { is_expected.to respond_to(:touch_in)}
  it {is_expected.to respond_to(:touch_out)}
  it {is_expected.to respond_to(:in_journey?)}

describe "#touch_in" do
  it "touches in oystercard" do
    expect(subject.touch_in).to eq(true)
  end
end

describe "#touch_out" do
  it "touches out oystercard" do
    subject.touch_in
    expect(subject.touch_out).to eq(false)
  end
end

describe "#in_journey?" do
  it "it returns true when touched in" do
  subject.touch_in
  expect(subject.in_journey?).to eq(true)
  end
end

end
