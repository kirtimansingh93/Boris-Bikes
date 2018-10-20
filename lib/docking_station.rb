require_relative 'bike'
class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available.' if empty?
    raise 'No working bikes available.' if bikes.all? { |bike| bike.broken? }
    bikes.pop
  end

  def dock(bike)
    raise 'Docking Station is full.' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

 def full?
   bikes.count == capacity
 end

 def empty?
   bikes.empty?
 end

end
