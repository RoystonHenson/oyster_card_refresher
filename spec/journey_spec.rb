require 'journey'

describe Journey do
  subject { described_class.new('Aldgate East') }

  describe '#initialize' do
    it 'has a starting location' do
      expect(subject.current_journey[:start]).to eq('Aldgate East')
    end

  end
end
