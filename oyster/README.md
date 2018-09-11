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
oystercard.balance == 10 <!-- true! -->

<!-- In order to protect my money from theft or loss
As a customer
I want a maximum limit of 90 on my card -->
 oystercard.top_up(81)
 <!--raise_error-->
oystercard.deduct(1)
oystercard.balance == 9

<!-- In order to get through the barriers.
As a customer
I need to touch in and out. -->
oystercard.touch_in
<!-- returns true -->
oystercard.in_journey?
<!-- returns true -->
oystercard.touch_out
<!-- returns false -->

<!-- In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey. -->
