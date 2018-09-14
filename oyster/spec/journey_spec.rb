require 'journey'
require 'oystercard'
describe Journey do
  let(:entry_station) {double("station_new")}
  let(:exit_station) {double("exit_station")}
  # it "checks journeys is empty by default" do
  #   expect(subject.journeys).to be_empty
  # end
describe '#Log journey' do
  it 'pushes a hash of the entry stations to journeys array' do
    # subject.top_up(10)
    subject.start_journey(entry_station)
    expect(subject.journeys).to eq([{ entry_station: entry_station }])
  end

  it 'adding exit_station key value pair to journeys' do
    # subject.top_up(10)
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    expect(subject.journeys).to eq([{ entry_station: entry_station,
                                      exit_station: exit_station }])
  end
end

end
