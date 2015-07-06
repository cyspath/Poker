require 'player'

describe Player do
  subject(:mike) { Player.new("Mike", 100)}

  describe "#name" do
    it " assigns the name properly" do
<<<<<<< HEAD
      expect(mike.name).to eq("Mike")
=======
      expect(mike.name).to be("Mike")
>>>>>>> fd483fc7fbdf207e7983d6073c8c16c2c89a5444
    end
  end

  describe "#bank" do
    it "should contain correct amount of money when initialized" do
<<<<<<< HEAD
      expect(mike.bank).to eq(100)
=======
      expect(mike.bank).to be(100)
>>>>>>> fd483fc7fbdf207e7983d6073c8c16c2c89a5444
    end
  end

  describe "#bet(num)" do
    it "should correct deduct money from the bank" do
      mike.bet(55)
<<<<<<< HEAD
      expect(mike.bank).to eq(45)
=======
      expect(mike.bank).to be(45)
>>>>>>> fd483fc7fbdf207e7983d6073c8c16c2c89a5444
    end
  end

  describe "#raise(num)" do
    it "should deduct money from the pot" do
      mike.raise(40)
<<<<<<< HEAD
      expect(mike.bank).to eq(60)
=======
      expect(mike.bank).to be(60)
>>>>>>> fd483fc7fbdf207e7983d6073c8c16c2c89a5444
    end
  end

end
<<<<<<< HEAD















=======
>>>>>>> fd483fc7fbdf207e7983d6073c8c16c2c89a5444
