class Station   

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def zone 
    zones = [["Waterloo", "Aldgate East"],["Camden", "Lambeth"]]

    zone = 0

    zones.each_with_index do |stations, index|
      zone = index + 1 if stations.include?(name)
    end

    zone 
  end

end