 require './lib/station'
require './lib/journey'

class Oystercard

  attr_reader :balance, :entry_station, :journeys, :journey_class

  MAXIMUM_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(balance = 0, station = nil, journey_class = Journey)
    @balance = balance
    @journey_class = Journey
    @entry_station = station
    @journeys =[]
  end

  def top_up(amount)
    fail "Exceeds balance limit of £#{MAXIMUM_LIMIT}" if exceeds_balance?(amount)
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    fail "Minimum required is £#{MINIMUM_AMOUNT}" if below_minimum?
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct_fare
    journeys << @journey_class.new(@entry_station, exit_station)
    @entry_station = nil
  end

  private

  def exceeds_balance?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

  def below_minimum?
    @balance < MINIMUM_AMOUNT
  end

  def deduct_fare
    @balance -= 4
  end

end
