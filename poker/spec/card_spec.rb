require 'rspec'
require 'card'

describe Card do

  subject(:value) {:ten}
  subject(:suit) { :hearts }
  subject(:card) { Card.new(value, suit) }

  describe "#value" do
    it "returns a cards's face value" do
      expect(card.value).to eq(:ten)
    end
  end

  describe "#suit" do
    it "should return a card's suit" do
      expect(card.suit).to eq(:hearts)
    end
  end

  describe "#face_up" do
    it "should return true if it is already face up" do
      expect(card.face_up).to eq(false)
    end
  end

  describe "#flip_card" do
    it "changes its instant variable face_up" do
      card.face_up = false
      card.flip_card
      expect(card.face_up).to eq(true)
      card.flip_card
      expect(card.face_up).to eq(false)
    end
  end



end
