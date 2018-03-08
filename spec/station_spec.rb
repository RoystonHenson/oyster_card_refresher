require 'station'

describe Station do
  test_station = YAML.load_file('stations.yml')['stations'][0]
  test_name = test_station['name']
  test_zone = test_station['zone']
  subject { described_class.new(test_name, test_zone) }

  describe '#initialize' do
    it 'initialises with a name' do
      expect(subject.name).to eq('Aldgate East')
    end

    it 'initialises with a zone' do
      expect(subject.zone).to eq(1)
    end
  end
end
