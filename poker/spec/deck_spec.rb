require 'card'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }
  let(:cards_removed) {deck.remove_cards(5)}

  # let(:hand) { double("some_name", method1: ['array', 'that', 'I', 'define'],
  #                                  method2: :symbol,
  #                                  method3: 6)}

  describe "#generate_deck" do
    it "should generate a deck of 52 cards" do
      expect(deck.generate_deck).to be_a(Array)
      expect(deck.generate_deck.count).to be(52)
    end

    it "should contain only intance objs of Card" do
      expect(deck.cards.sample).to be_a(Card)
    end

    it "should have a instance variable @cards that hold all of the cards" do
      deck2 = Deck.new
      expect(deck2.cards.count).to be(52)
      # allow(hand).to receive(:method1).with("argument").and_respond_with("return")
      # allow(hand).to receive(:new_method).with("something").and_respond_with("thing")
      # hand.method1
    end
  end




  describe "#remove_cards" do

    it "should remove correct number of cards from deck" do
      expect(cards_removed).to be_a(Array)
      expect(cards_removed.count).to be(5)
    end

    it "removed cards are instance objects of class Card" do
      expect(cards_removed.sample).to be_a(Card)
    end

    it "should raise error if the deck is empty or do not have enough" do
      expect{ deck.remove_cards(53) }.to raise_error
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


end
