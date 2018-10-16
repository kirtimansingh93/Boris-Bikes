require_relative 'bike'
class DockingStation
  attr_reader :bike

  def release_bike
    raise 'No bikes available.' unless @bike
    @bike
  # If bike = Bike.new hasn't been docked, then @bike instance variable contains nothing.
  end

  def dock(bike)
    raise 'Docking Station is full.' if @bike
    @bike = bike
  # This saves bike = Bike.new into @bike. Now the dockingstation has a bike to release.
  end

end
