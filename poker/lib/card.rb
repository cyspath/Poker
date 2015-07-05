

class Card
  attr_reader :value, :suit
  attr_accessor :face_up

  def initialize(value, suit)
    @value = value
    @suit = suit
    @face_up = false
  end

  def flip_card
    if @face_up == true
      @face_up = false
    else
      @face_up = true
    end
  end

  VALUES = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :A]

  SUITS = [:diamonds, :hearts, :spades, :clubs]
end
