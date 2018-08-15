require 'station'

describe Station do
  it "has a name" do
    waterloo = Station.new("Waterloo")
    expect(waterloo.name).to eq("Waterloo")
  end

  it "has a zone" do
    waterloo = Station.new("Waterloo")
    expect(waterloo.station_zone).to eq(1)
  end
end