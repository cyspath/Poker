require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = generate_deck
  end

  def generate_deck
    arr = []
    Card::VALUES.each do |v|
      Card::SUITS.each do |s|
        arr << Card.new(v, s)
      end
    end
    arr
  end

  def remove_cards(n)
    raise "not enough cards left in deck" if n > @cards.count
    taken_arr = []
    n.times do
      taken_arr << @cards.shift
    end
    taken_arr
  end

  def shuffle
    @cards.shuffle
  end

end
