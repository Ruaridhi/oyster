<!-- In order to use public transport
As a customer
I want money on my card -->

load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.balance == 0

<!-- In order to keep using public transport
as a customer
I want to add money to my card -->
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(10)
oystercard.balance == 10 <!-- true! -->

<!-- In order to protect my money from theft or loss
As a customer
I want a maximum limit of 90 on my card -->
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(81)
 <!--raise_error-->
oystercard.deduct(1)
oystercard.balance == 9

<!-- In order to get through the barriers.
As a customer
I need to touch in and out. -->
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.touch_in
<!-- returns true -->
oystercard.in_journey?
<!-- returns true -->
oystercard.touch_out
<!-- returns false -->

<!-- In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey. -->
it "raises error when credit is less then £1 minimum fare"
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(0.9)
expect{subject.touch_in}.to raise_error('Insufficient funds')

<!-- In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card -->
it "deducts minimum fair when touching out"
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.touch_in
MIN_FAIR = 1
oystercard.touch_out
oystercard.balance = new balance

<!-- In order to pay for my journey
As a customer
I need to know where I've travelled from -->
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(10)
oystercard.touch_in
oystercard.station

<!-- In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out -->
load './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(10)
oystercard.touch_in('Kings Cross')
