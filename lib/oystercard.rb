class Oystercard
  attr_reader :balance, :touched_in, :entry_station, :exit_station

  START_BALANCE = 5
  MAX_BALANCE = 90
  FARE = 2.4
  MIN_FARE = 1

  def initialize
    @balance = START_BALANCE
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
    raise "Maximum balance allowed is £#{MAX_BALANCE}." if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'Not enough funds. Please top up.' if fare_low?
    @entry_station = station
  end

  def touch_out(station)
    deduct(FARE)
    @exit_station = station
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def fare_low?
    balance < MIN_FARE
  end

  def deduct(amount)
    @balance -= amount
  end
end
