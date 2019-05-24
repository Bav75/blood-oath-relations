require "spec_helper"

describe "Cult" do

  describe "#name" do
    it "has a name" do
      heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)

      expect(heavens_gate.name).to eq("Heaven's Gate")
    end
  end

  describe ".all" do
    it "knows about all cult instances" do
        heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)
        illuminati = Cult.new("The Illuminati", "Berlin", "It's lit", 1600)

      expect(Cult.all).to include(heavens_gate)
      expect(Cult.all).to include(illuminati)
    end
  end

  describe "#location" do
    it "returns a String that is the city where the cult is located" do
      heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)
      
      expect(heavens_gate.location).to eq("San Diego")
    end
  end

  describe "#slogan" do
    it "returns a String that is this cult's slogan" do
      heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)

      expect(heavens_gate.slogan).to eq("Dank cult stuff")
    end
  end

  describe "#founding_year" do
    it "returns an Integer that is the year the cult was founded" do
      heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)

      expect(heavens_gate.founding_year).to be_a Integer
      expect(heavens_gate.founding_year).to eq(1974)
    end
  end

#   describe "#cult_population" do
#     it "returns an Integer that is the number of followers in this cult" do
#       heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)
#       expect(heavens_gate.founding_year).to be_a Integer
#       expect(heavens_gate.founding_year).to eq(1974)
#     end
#   end

  describe "#recruit_follower" do
    it "takes in an argument of a Follower instance and adds them to this cult's list of followers" do
        heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)
        heavens_gate.recruit_follower(follower)

        expect(heavens_gate.followers).to include(follower)
    end
  end

end
