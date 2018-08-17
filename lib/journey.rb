require_relative 'station'

class Journey
  attr_reader :journey, :entry_station, :exit_station

  def initialize(station = Station)
    @station = station
    @journey = {}
    @entry_station = nil
    @exit_station
  end

  def in_journey?
    !!@entry_station
  end

  def start(station_name)
    starting_station = @station.new(station_name)
    @entry_station = starting_station.name
  end 

  def finish(station_name)
    ending_station = @station.new(station_name)
    @exit_station = ending_station.name
    complete_journey
    @entry_station = nil
  end


  def complete_journey
    @journey["Entry station"] = @entry_station
    @journey["Exit station"] = @exit_station
  end

  def full_journey
    @journey
  end

end