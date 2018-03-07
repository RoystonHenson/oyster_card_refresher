class Oystercard
  attr_reader :balance

  START_BALANCE = 5
  MAX_BALANCE = 90

  def initialize
    @balance = START_BALANCE
  end

  def top_up(amount)
    raise "Maximum balance allowed is £#{MAX_BALANCE}." if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
