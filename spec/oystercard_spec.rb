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

  describe '#touch_in' do
    it 'returns touched in as true' do
      expect { subject.touch_in }.to change { subject.touched_in }.to(true)
    end
  end

  describe '#touch_out' do
    it 'returns touched in as false' do
      subject.touch_in
      expect { subject.touch_out }.to change { subject.touched_in }.to(false)
    end
  end

  describe '#in_journey?' do
    context 'when touched out' do
      it 'returns false' do
        expect(subject.in_journey?).to eq(false)
      end
    end
    
    context 'when touched in' do
      it 'returns true' do
        subject.touch_in
        expect(subject.in_journey?).to eq(true)
      end
    end


  end
end
