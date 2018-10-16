require 'docking_station'
describe DockingStation do

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when no more bikes are available at docking station' do
      expect { subject.release_bike }.to raise_error 'No bikes available.'
    end
  end

  describe '#working?' do
    it '#working?' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock(bike)' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq(bike)
    end
    it 'raises an error when docking station is full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking Station full.'
    end
  end

  describe '#bike' do
    it { is_expected.to respond_to(:bike) }
    it 'shows whether there is a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq(bike)
    end
  end
end
