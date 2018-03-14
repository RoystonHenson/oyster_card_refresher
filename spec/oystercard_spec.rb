require 'oystercard'

describe Oystercard do
  let(:station) { double('Aldgate East') }
  let(:station_2) { double('Tottenham Court Road') }

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

  describe '#touch_in' do
    context 'when touched out' do
      it 'touches in' do
        expect { subject.touch_in(station) }.to change { subject.touched_in }.to(true)
      end

      it 'raises error when balance less than minimum fare' do
        allow(subject).to receive(:balance).and_return(0.99)
        expect { subject.touch_in(station) }.to raise_error('Not enough funds. Please top up.')
      end


    end
  end

  describe '#touch_out' do
    context 'when touched in' do
      it 'touches out' do
        subject.touch_in(station)
        expect { subject.touch_out(station_2) }.to change { subject.touched_in }.to(false)
      end

      it 'deducts fare when touching out' do
        subject.touch_in(station)
        expect { subject.touch_out(station_2) }.to change { subject.balance }.by(-Journey::FARE)
      end




    end
  end


end
