require_relative 'journey'
class Oystercard

  attr_reader :balance
  #attr_accessor :in_journey
  MAXIMUM = 90
  MIN_FAIR = 1

  def initialize
    @balance = 0
    @new_journey = Journey.new
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
      @balance += money
  end

  def touch_in(station)
    fail 'Insufficient funds' if balance < MIN_FAIR
    @new_journey.start_journey(station)
    @in_journey = true
  end

  def touch_out(exit_station)
    @new_journey.end_journey(exit_station)
    #@exit_station = exit_station
    @in_journey = false
    deduct(MIN_FAIR)
  end

  def in_journey?
    !(@new_journey.journeys[-1].has_key? :exit_station)
  end

private

def deduct(money)
  @balance -= money
end

end
