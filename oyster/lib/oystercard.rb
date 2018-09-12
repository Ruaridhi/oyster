class Oystercard

  attr_reader :balance
  #attr_accessor :in_journey
  MAXIMUM = 90
  MIN_FAIR = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
      @balance += money
  end

  def touch_in
    fail 'Insufficient funds' if balance < 1
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FAIR)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

private

def deduct(money)
  @balance -= money
end

end
