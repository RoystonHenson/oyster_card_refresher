require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'initialises with a balance' do
      subject { Oystercard.new(0)   }
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'tops up card' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end
  end
end
