require 'station'

describe Station do
  subject { described_class.new('Aldgate East', 1) }

  describe '#initialize' do
    it 'initialises with a name' do
      expect(subject.name).to eq('Aldgate East')
    end

    it 'initialises with a zone' do
      expect(subject.zone).to eq(1)
    end
  end
end
