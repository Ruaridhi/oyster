require 'oystercard'

describe Oystercard do
  it 'should have a balance method' do
    expect(subject).to respond_to(:balance)
  end

  it "the balance should be 0 by default" do
    expect(subject.balance).to eq 0
  end
end
