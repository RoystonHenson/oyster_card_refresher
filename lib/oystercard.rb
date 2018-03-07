class Oystercard
  attr_reader :balance, :touched_in

  START_BALANCE = 5
  MAX_BALANCE = 90

  def initialize
    @balance = START_BALANCE
    @touched_in = false
  end

  def top_up(amount)
    raise "Maximum balance allowed is £#{MAX_BALANCE}." if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @touched_in = true
  end

  def touch_out
    @touched_in = false
  end

  def in_journey?
    @touched_in
  end
end
