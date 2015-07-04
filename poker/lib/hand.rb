
class Hand
  attr_reader :current

  def initialize
    @current = []
  end

  def receive_cards(arr_of_cards)
    arr_of_cards.each { |x| @current << x }
    arr_of_cards
  end

  def drop_cards(idx)
    @current.delete_at(idx)
  end

  def won_vs(other_hand)
    if rankings(@current) > rankings(other_hand)
      return true
    elsif rankings(@current) < rankings(other_hand)
      return false
    else
      #assuming we dont care about comparing hands in extreme detail
      return false ##############
  end

  def rankings(cards)
    a,b,c,d,e = cards
    av, bv, cv, dv, ev = a.value, b.value, c.value, d.value, e.value
    as, bs, cs, ds, es = a.suit, b.suit, c.suit, d.suit, e.suit
    values = [av, bv, cv, dv, ev]
    suits = [as, bs, cs, ds, es]

    vsort = values.sort
    #case royal flush
    royal_check = [:A, :king, :queen, :jack, :ten]
    all_cards = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :A]


    if suits.uniq == 1 &&
      values.include?(:A) &&
      values.include?(:king) &&
      values.include?(:queen) &&
      values.include?(:jack) &&
      values.include?(:ten)

      return 10 #royal flush

    elsif suits.uniq == 1 &&
      all_cards.join("").inlude?(values.join(""))

      return 9 #straight flush

    elsif vsort[0..3].uniq == 1 || vsort[1..4].uniq == 1

      return 8 #4 of a kind

    elsif (vsort[0..2].uniq == 1 && vsort[3..4].uniq == 1) ||
        (vsort[0..1].uniq == 1 && vsort[2..4].uniq == 1)

      return 7 # 3 of kind with a pair - full house

    elsif suits.uniq == 1

      return 6 # same suit - flush

    elsif all_cards.join("").inlude?(values.join(""))

      return 5 # straight but not in sequence - straight

    elsif vsort[0..2].uniq == 1 || vsort[2..4].uniq == 1

      return 4 # three of a kind

    elsif values.uniq == 3
          # (vs[0] == vs[1] && vs[2] == vs[3]) ||
          # (vs[1] == vs[2] && vs[3] == vs[4]) ||
          # (vs[0] == vs[1] && vs[3] == vs[4])

      return 3 # 2 pairs

    elsif values.uniq == 4

      return 2 # 1 pair

    else

      return 1
    end
  end











end
