require_relative 'journey'

class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :journey_history
  
  def initialize(journey = Journey.new)
    @balance = 0
    @card_status = false
    @journey_history = []
    @journey = journey
  end

  def top_up(amount)
    fail "Maximum value of #{MAXIMUM_BALANCE} on Oystercard reached!!" if balance_maxed?(amount)
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station_name)
    fail "Insufficient funds, you have #{self.balance} on your card" if insufficient_funds?
    @journey.start(station_name)
    # starting_station = @station.new(station_name)
    # @entry_station = starting_station.name
  end

  
  def touch_out(station_name)
    deduct(MINIMUM_FARE)
    @journey.finish(station_name)
    @journey_history << @journey.full_journey
    # ending_station = @station.new(station_name)
    # @exit_station = ending_station.name
    # complete_journey
    # @entry_station = nil
  end
  
  # def last_journey
  #   "Start station: #{journey["Entry station"]}; End station: #{journey["Exit station"]}"
  # end
  
  private
  def balance_maxed?(amount)
    (@balance + amount) > MAXIMUM_BALANCE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  # def complete_journey
  #   @journey["Entry station"] = @entry_station
  #   @journey["Exit station"] = @exit_station
     #journey_history << journey
  # end

  def deduct(amount)
    @balance -= amount
  end

end


# In order to use public transport
# As a customer
# I want money on my card

# In order to keep using public transport
# As a customer
# I want to add money to my card

# In order to protect my money
# As a customer
# I don't want to put too much money on my card

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

# In order to get through the barriers
# As a customer
# I need to touch in and out

# In order to pay for my journey
# As a customer
# I need to have the minimum amount for a single journey

# In order to pay for my journey
# As a customer
# I need to pay for my journey when it's complete

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

# In order to know where I have been
# As a customer
# I want to see to all my previous trips

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in

# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

# In order to be charged the correct amount
# As a customer
# I need to have the correct fare calculated