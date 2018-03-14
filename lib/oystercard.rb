require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :touched_in

  START_BALANCE = 5
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = START_BALANCE
    @touched_in = false
  end

  def top_up(amount)
    raise "Maximum balance allowed is £#{MAX_BALANCE}." if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'Not enough funds. Please top up.' if fare_low?
    @touched_in = true
  end

  def touch_out(station)
    deduct(Journey::FARE)
    @touched_in = false
  end

  private

  def fare_low?
    balance < MIN_FARE
  end

  def deduct(amount)
    @balance -= amount
  end
end
