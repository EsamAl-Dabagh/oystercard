require 'oystercard'

describe Oystercard do 

  describe ".balance" do
    it "returns the balance on the .oystercard" do
      expect(subject.balance).to eq 0
    end
  end
  describe ".journey_history" do
    it "should be empty on instatiation" do
      expect(subject.journey_history).to eq []
    end

    it "logs journeys in hashes" do
      subject.top_up(10)
      subject.touch_in("Liverpool Street")
      subject.touch_out("Bank")
      expect(subject.journey_history).to eq([{"Entry station" => "Liverpool Street", "Exit station" => "Bank"}])
    end
  end

  describe "#top-up" do
    it "should increase the balance amount" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
    it "should raise an error if maximum balance is exceeded by #topup" do
      max = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max)
      expect { subject.top_up(1) }.to raise_error("Maximum value of #{max} on Oystercard reached!!")
    end
  end

  describe "#in_journey?" do
    it "should return false" do 
      expect(subject.in_journey?).to eq false
    end
  end

  describe "#touch_in" do 
    before(:each) do
      subject.top_up(Oystercard::MINIMUM_FARE)
    end
    it "should change #in_journey to true" do 
      subject.touch_in("Aldgate East")
      expect(subject.in_journey?).to eq true
    end
    it "should raise an error if insufficient funds (minumum fare - 1)" do
      # Overriding the 'before' stuff
      subject.instance_variable_set(:@balance,Oystercard::MINIMUM_FARE - 1)
      expect { subject.touch_in("Aldgate East") }.to raise_error("Insufficient funds, you have #{subject.balance} on your card")
    end
    it "should set entry station when it is touched_in" do
      subject.touch_in("Aldgate East")
      expect(subject.entry_station).to eq "Aldgate East"
    end
    it "should set exit station when #touch_out is called" do
      subject.touch_out("Victoria")
      expect(subject.exit_station).to eq "Victoria"
    end
  end

  describe "#touch_out" do
    before(:each) do
      subject.top_up(Oystercard::MINIMUM_FARE)
      subject.touch_in("Aldgate East")
    end
   # removing this for now. Will find a better way to test #in_journey
    # it "should change #in_journey to false" do
    #   subject.touch_out("Victoria")
    #   expect(subject.in_journey?).to eq false
    # end
    it "should reduce the balance by the MINIMUM FARE" do
      expect { subject.touch_out("Victoria")}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
    end
  end

  describe "#journey" do
    before(:each) do
      subject.top_up(Oystercard::MINIMUM_FARE)
      subject.touch_in("Aldgate East")
      subject.touch_out("Victoria")
    end
    it "should return the most recent journey" do
      expect(subject.last_journey).to eq "Start station: Aldgate East; End station: Victoria"
    end
  end
end
