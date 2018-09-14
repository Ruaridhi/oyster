require_relative 'oystercard'

class Journey
  attr_reader :journeys

  def initialize
    @journeys = []
  end

  def start_journey(station)
    @journeys << { entry_station: station }
  end

  def end_journey(exit_station)
    @journeys[-1][:exit_station] = exit_station
  end
end
