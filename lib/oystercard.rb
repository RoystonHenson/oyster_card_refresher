class Oystercard
  attr_reader :balance, :touched_in

  START_BALANCE = 5
  MAX_BALANCE = 90
  FARE = 2.4
  MIN_FARE = 1

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
    raise 'Not enough funds. Please top up.' if fare_low?
    @touched_in = true
    deduct(FARE)
  end

  def touch_out
    @touched_in = false
  end

  def in_journey?
    @touched_in
  end

  private

  def fare_low?
    balance < MIN_FARE
  end
end
