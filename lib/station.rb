require 'zones'

class Station   
  include Zones
  attr_reader :name, :station_zone

  def initialize(name)
    @name = name
    @station_zone = find_zone(name)
  end

end
