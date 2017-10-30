class Oystercard

  attr_reader :balance

  MAXIMUM_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Exceeds balance limit of £#{MAXIMUM_LIMIT}" if exceeds_balance?(amount)
    @balance += amount
  end

  private

  def exceeds_balance?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end
  
end
