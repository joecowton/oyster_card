class Oystercard

  attr_reader :balance

  MAXIMUM_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(amount = 10)
    @journey = false
    @balance = amount
  end

  def top_up(amount)
    fail "Exceeds balance limit of £#{MAXIMUM_LIMIT}" if exceeds_balance?(amount)
    @balance += amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    fail "Minimum required is £#{MINIMUM_AMOUNT}" if below_minimum?
    @journey = true
  end

  def touch_out
    deduct
    @journey = false
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
