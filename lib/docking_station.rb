require_relative 'bike'
class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  DEFAULT_CAPACITY = 20

  def release_bike
    raise 'No bikes available.' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'Docking Station is full.' if full?
    @bikes << bike
  end

  private

 def full?
   @bikes.count == DEFAULT_CAPACITY
 end

 def empty?
   @bikes.empty?
 end

end
