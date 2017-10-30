class Oystercard

  attr_reader :balance

  MAXIMUM_LIMIT = 90

  def initialize(amount = 10)
    @balance = amount
  end

  def top_up(amount)
    fail "Exceeds balance limit of £#{MAXIMUM_LIMIT}" if exceeds_balance?(amount)
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
    

  private

  def exceeds_balance?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

end
