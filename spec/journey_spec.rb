require 'journey'

describe Journey do

  describe "#start"
  it "will change #in_journey to true" do 
    subject.start("Waterloo")
    expect(subject.in_journey?).to eq true
  end

  it "will set entry station when journey is started" do
    subject.start("Aldgate East")
    expect(subject.entry_station).to eq "Aldgate East"
  end

  it "should set exit station when #finish is called" do
    subject.finish("Camden")
    expect(subject.exit_station).to eq "Camden"
  end

end