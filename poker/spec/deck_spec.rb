require 'card'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }


  describe "#generate_deck" do
    it "should generate a deck of 52 cards" do
      expect(deck.generate).to be(Array)
      expect(deck.generate.count).to be(52)
    end

    it "should automatically initializes deck" do
      expect(:initialize).to receive(:generate_deck)
    end

    it "should contain only intance objs of Card" do
      expect(deck.sample).to be_a(Card)
    end
  end


  describe "#remove_cards" do
    before do
      cards_removed = deck.remove_cards(5)
    end
    it "should remove correct number of cards from deck" do
      expect(cards_removed).to be_a(Array)
      expect(cards_removed.count).to be(5)
    end

    it "removed cards are instance objects of class Card" do
      expect(cards_removed).to be_a(Card)
    end

    it "should raise error if the deck is empty or do not have enough" do
      expect(deck.remove_cards(53)).to raise_error("not enough cards left in deck")
    end
  end

  describe "#cards" do
    it "should contain all unique 52 cards" do
      expect(deck.cards.uniq.count).to be(52)
    end

    it "each card is actually a Card!" do
      expect(deck.cards.first).to be_a(Card)
    end
   end

   describe "#shuffle" do
    it "should shuffle the deck" do
        expect(deck.cards.shuffle.first).to_not eq(deck.cards.first)
    end
   end
end
