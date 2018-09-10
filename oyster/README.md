<!-- In order to use public transport
As a customer
I want money on my card -->

load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.balance == 0

<!-- In order to keep using public transport
as a customer
I want to add money to my card -->
oystercard.top_up(10)
balance == 10 <!-- true! -->

<!-- In order to protect my money from theft or loss
As a customer
I want a maximum limit of 90 on my card -->
