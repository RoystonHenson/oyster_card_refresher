require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'initialises with a balance' do
      subject { Oystercard.new(Oystercard::START_BALANCE) }
      p subject.balance
      expect(subject.balance).to eq(Oystercard::START_BALANCE)
    end
  end

  describe '#top_up' do
    it 'tops up card' do
      subject.top_up(5)
      expect(subject.balance).to eq(Oystercard::START_BALANCE + 5)
    end

    it 'raises error if over maximum balance' do
      expect { subject.top_up(91) }.to raise_error("Maximum balance allowed is £#{Oystercard::MAX_BALANCE}.")
    end
  end
end
