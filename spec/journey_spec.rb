require 'journey'

describe Journey do
  let(:start_station) { double('Aldgate East') }
  let(:end_station) { double('Tottenham Court Road') }
  subject { described_class.new(start_station) }

  describe '#initialize' do
    it 'has a starting location' do
      expect(subject.current_journey[:start]).to eq(start_station)
    end

    it 'is in journey' do
      expect(subject.in_journey).to eq(true)
    end

    it 'has no end journey' do
      expect(subject.current_journey[:end]).to eq(nil)
    end
  end

  describe '#finish' do
    it 'saves finishing location' do
      subject.finish(end_station)
      expect(subject.current_journey[:end]).to eq(end_station)
    end
  end

  describe '#calculate_fare' do
    it 'returns minimum fare for the journey' do
      subject.finish(end_station)
      expect(subject.calculate_fare).to eq(Journey::MIN_FARE)
    end

    it 'returns penalty fare when start or end of journey is nil' do
      expect(subject.calculate_fare).to eq(Journey::PENALTY_FARE)
    end
  end

  describe '#in_journey?' do
    context 'after journey is started' do
      it 'is in journey' do
        expect(subject.in_journey?).to eq(true)
      end
    end

    context 'after journey is completed' do
      it 'is not in journey' do
        subject.finish(end_station)
        expect(subject.in_journey?).to eq(false)
      end
    end
  end
end
