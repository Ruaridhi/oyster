class Oystercard

  attr_reader :balance
  MAXIMUM = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail 'Unable to top up,maximum #{Oystercard::MAXIMUM} reached'if balance + money > MAXIMUM
      @balance += money
  end

end
