require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'initialises with a balance' do
      expect(subject.balance).to eq(Oystercard::START_BALANCE)
    end
  end

  describe '#top_up' do
    it 'tops up card' do
      expect { subject.top_up(5) }.to change { subject.balance }.by(5)
    end

    it 'raises error if over maximum balance' do
      expect { subject.top_up(91) }.to raise_error("Maximum balance allowed is £#{Oystercard::MAX_BALANCE}.")
    end
  end

  describe '#deduct' do
    it 'deducts fare from balance' do
      expect { subject.deduct(1) }.to change { subject.balance }.by(-1)
    end
  end
end
