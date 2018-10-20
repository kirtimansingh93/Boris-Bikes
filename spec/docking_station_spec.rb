require 'docking_station'
describe DockingStation do

  describe ' #release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when no more bikes are available at docking station' do
      expect { subject.release_bike }.to raise_error 'No bikes available.'
    end
    it 'does not release broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available.'
    end
  end

  describe ' #working?' do
    it '#working?' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe ' #dock(bike)' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq([bike])
    end
    it 'raises an error when docking station is full' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking Station is full.'
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(Bike.new) }
      expect{ docking_station.dock(Bike.new) }.to raise_error 'Docking Station is full.'
    end
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking Station is full.'
    end
  end

end
