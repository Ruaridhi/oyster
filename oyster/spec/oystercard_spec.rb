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

end
