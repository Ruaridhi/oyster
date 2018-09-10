class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail 'Unable to top up,maxmium reached'if balance + money > 90
      @balance += money
  end

end
