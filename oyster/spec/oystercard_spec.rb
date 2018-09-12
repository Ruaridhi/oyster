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

  #
  it "should deduct money from balance when used" do
    expect {subject.touch_out}.to change{subject.balance}.by(-1)
  end


describe "#touch_in" do
  it "raises error when credit is less then £1 minimum fare" do
    subject.top_up(0.9)
    expect{subject.touch_in}.to raise_error('Insufficient funds')
  end

describe "touch in with credit" do
  before (:each)do
    subject.top_up(10)
  end
  it "touches oystercard in when sufficient credit" do
      expect(subject.touch_in).to eq true
  end

end

describe "#touch_out" do
  it "touches out oystercard" do
    subject.top_up(10)
    subject.touch_in
    expect(subject.touch_out).to eq(false)
  end

  it "deducts minimum fair from balance when touched out" do
    expect{subject.touch_out}.to change{subject.balance}.by (-Oystercard::MIN_FAIR)
  end

end

describe "#in_journey?" do
  it "it returns true when touched in" do
  subject.top_up(10)
  subject.touch_in
  expect(subject.in_journey?).to eq(true)
  end
end
end
end
