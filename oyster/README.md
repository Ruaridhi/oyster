<!-- In order to use public transport
As a customer
I want money on my card -->

load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.balance == 0
