require 'oystercard'

describe Oystercard do
  let(:station) { double('Aldgate East') }
  let(:station_2) { double('Tottenham Court Road') }

  describe '#initialize' do
    it 'initialises with a balance' do
      expect(subject.balance).to eq(Oystercard::START_BALANCE)
    end

    it 'initialises with empty list of journeys' do
      expect(subject.journeys).to eq([])
    end

    it 'initialises with empty current journey' do
      expect(subject.current_journey[:'entry station']).to eq(nil)
      expect(subject.current_journey[:'exit station']).to eq(nil)
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
        expect { subject.touch_in(station) }.to change { subject.in_journey? }.to(true)
      end

      it 'raises error when balance less than minimum fare' do
        allow(subject).to receive(:balance).and_return(0.99)
        expect { subject.touch_in(station) }.to raise_error('Not enough funds. Please top up.')
      end

      it 'saves entry station' do
        expect { subject.touch_in(station) }.to change { subject.current_journey[:'entry station'] }.to(station)
      end
    end
  end

  describe '#touch_out' do
    context 'when touched in' do
      it 'touches out' do
        subject.touch_in(station)
        expect { subject.touch_out(station_2) }.to change { subject.in_journey? }.to(false)
      end

      it 'deducts fare when touching out' do
        subject.touch_in(station)
        expect { subject.touch_out(station_2) }.to change { subject.balance }.by(-Oystercard::FARE)
      end

      it 'resets entry station' do
        subject.touch_in(station)
        expect { subject.touch_out(station_2) }.to change { subject.current_journey[:'entry station'] }.to(nil)
      end

      it 'saves exit station' do
        subject.touch_in(station)
        subject.touch_out(station_2)
        expect(subject.journeys.last[:'exit station']).to eq(station_2)
      end

      it 'saves complete journey' do
        subject.touch_in(station)
        subject.touch_out(station_2)
        expect(subject.journeys).to include({'entry station': station, 'exit station': station_2})
      end
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
        subject.touch_in(station)
        expect(subject.in_journey?).to eq(true)
      end
    end
  end
end
