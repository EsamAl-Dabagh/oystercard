module Zones

  ZONES = [["Waterloo", "Aldgate East"],["Camden", "Lambeth"]]
  
  def find_zone(name)
    zone = 0
    
    ZONES.each_with_index do |stations, index|
      zone = index + 1 if stations.include?(name)
    end

    zone 
  end

end