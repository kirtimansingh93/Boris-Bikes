require 'docking_station'
describe DockingStation do
  let (:bike) {double :bike}
  describe ' #release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when no more bikes are available' do
      expect { subject.release_bike }.to raise_error 'No bikes available.'
    end
    it 'does not release broken bikes' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available.'
    end
    it 'releases a working bike' do
      bike = double(:bike, broken?: false, working?: true)
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
      expect(subject.dock(bike)).to eq([bike])
    end
    it 'raises an error when docking station is full' do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking Station is full.'
    end
    it 'accepts all bikes, broken or not' do
      bike2 = double(:bike, broken?: true)
      expect(subject.dock(bike)).to eq([bike])
      expect(subject.dock(bike2)).to eq([bike, bike2])
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }
      expect{ docking_station.dock(bike) }.to raise_error 'Docking Station is full.'
    end
    subject { DockingStation.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking Station is full.'
    end
  end

end
