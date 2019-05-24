require "spec_helper"

describe "BloodOath" do

  describe "#initiation_date" do
    it "returns a String that is the initiation date of this blood oath in the format YYYY-MM-DD" do
      bloodoath = BloodOath.new(heavens_gate, follower, "2019-05-24")

      expect(bloodoatj.initiation_date).to eq("2019-05-24")
    end
  end

  describe ".all" do
    it "knows about all bloodoath instances" do
        bloodoath1 = BloodOath.new(heavens_gate, follower, "2019-05-24")
        bloodoath2 = BloodOath.new(illuminati, follower, "2019-05-24")

        expect(BloodOath.all).to include(bloodoath1)
        expect(BloodOath.all).to include(bloodoath2)
    end
  end
