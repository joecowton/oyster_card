require 'station'

class Oystercard

  attr_reader :balance, :entry_station, :journeys, :all_journeys

  MAXIMUM_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(balance = 10, station = nil, journey_class = Journey)
    @balance = balance
    @entry_station = station
    @journeys = {}
    @all_journeys = []

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
    @journeys[:entry_station] = station
  end

  def touch_out(station)
    deduct
    @entry_station = nil
    @journeys[:exit_station] = station
    @all_journeys << @journeys
  end

  private

  def exceeds_balance?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

  def below_minimum?
    @balance < MINIMUM_AMOUNT
  end

  def deduct
    @balance -= 4
  end

end
