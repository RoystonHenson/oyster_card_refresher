require 'journey'

describe Journey do
  subject { described_class.new('Aldgate East') }
  let(:station) { double('Tottenham Court Road') }

  describe '#initialize' do
    it 'has a starting location' do
      expect(subject.current_journey[:start]).to eq('Aldgate East')
    end
  end

  describe '#finish' do
    it 'saves finishing location' do
      subject.finish(station)
      expect(subject.current_journey[:end]).to eq(station)
    end
  end
end
