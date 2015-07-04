require 'player'

describe Player do
  subject(:mike) { Player.new("Mike", 100)}

  describe "#name" do
    it " assigns the name properly" do
      expect(mike.name).to be("Mike")
    end
  end

  describe "#bank" do
    it "should contain correct amount of money when initialized" do
      expect(mike.bank).to be(100)
    end
  end

  describe "#bet(num)" do
    it "should correct deduct money from the bank" do
      mike.bet(55)
      expect(mike.bank).to be(45)
    end
  end

  describe "#raise(num)" do
    it "should deduct money from the pot" do
      mike.raise(40)
      expect(mike.bank).to be(60)
    end
  end

end
