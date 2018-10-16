require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike that works' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks a bike in the docking station' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq(bike)
  end

  it { is_expected.to respond_to(:bike) }

  it 'checks whether there is a bike to return' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end
end
