class Oystercard

  attr_reader :balance, :station
  #attr_accessor :in_journey
  MAXIMUM = 90
  MIN_FAIR = 1

  def initialize
    @balance = 0
    @station = nil
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
      @balance += money
  end

  def touch_in(station)
    fail 'Insufficient funds' if balance < MIN_FAIR
    @in_journey = true
    @station = station
  end

  def touch_out
    deduct(MIN_FAIR)
    @station = nil
  end

  def in_journey?
    @station != nil
  end

private

def deduct(money)
  @balance -= money
end

end
