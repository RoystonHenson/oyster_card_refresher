require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'initialises with a balance' do
      subject { Oystercard.new(0)   }
      expect(subject.balance).to eq(0)
    end
  end
end
