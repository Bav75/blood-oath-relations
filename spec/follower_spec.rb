require "spec_helper"

describe "Follower" do

  describe "#name" do
    it "has a name" do
      follower = Follower.new("Bob", 22, "YOLO")

      expect(follower.name).to eq("Bob")
    end
  end

  describe ".all" do
    it "knows about all follower instances" do
        follower1 = Follower.new("Bob", 22, "YOLO")
        follower2 = Follower.new("Jim", 26, "ABC - always be coding")

        expect(Follower.all).to include(follower1)
        expect(Follower.all).to include(follower2)
    end
  end

  describe "#age" do
    it "returns a Fixnum that is the age of the follower" do
        follower1 = Follower.new("Bob", 22, "YOLO")
        
        expect(follower1.age).to be_a Integer
        expect(follower1.age).to eq(22)
    end
  end

  describe "#life_motto" do
    it "returns a String that is the follower's life motto" do
        follower1 = Follower.new("Bob", 22, "YOLO")

        expect(follower1.life_motto).to eq("YOLO")
    end
  end

end
