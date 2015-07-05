require_relative 'card'

class Hand
  attr_accessor :current

  def initialize
    @current = [] # array of cards
  end

  def receive_cards(arr_of_cards)
    arr_of_cards.each { |x| @current << x }
    arr_of_cards
  end

  def drop_cards(idx_arr)
    array = []
    idx_arr.each do |idx|
      @current.each_with_index do |el, i|
        array << el if i != idx
      end
    end
    array.select! {|card| array.count(card) == idx_arr.length }
    array.uniq!
    @current = array
  end

  def won_vs(other_hand)

    all_cards_seq = {:two => 1, :three => 2, :four => 3, :five => 4, :six => 5, :seven => 6, :eight => 7, :nine => 8, :ten => 9, :jack => 10, :queen => 11, :king => 12, :A => 13 }

    input_seq1 = []
    input_seq2 = []

    @current.each do |card|
      input_seq1 << all_cards_seq[card.value]
    end
    input_seq1.sort!

    other_hand.current.each do |card|
      input_seq2 << all_cards_seq[card.value]
    end
    input_seq2.sort!

    player1_rank = rankings(@current)
    player2_rank = rankings(other_hand.current)

    msg(player1_rank)
    puts "vs"
    msg(player2_rank)


    if rankings(@current) > rankings(other_hand.current)
      return true
    elsif rankings(@current) < rankings(other_hand.current)
      return false
    elsif rankings(@current) == 1 && rankings(other_hand.current) == 1
      #if same rank, who ever has a bigger card in the 5 wins..
      return true if input_seq1.last >= input_seq2.last
      return false
    else
      false
    end
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

    all_cards_seq = {:two => 1, :three => 2, :four => 3, :five => 4, :six => 5, :seven => 6, :eight => 7, :nine => 8, :ten => 9, :jack => 10, :queen => 11, :king => 12, :A => 13 }

    input_seq = []
    values.each do |v|
      input_seq << all_cards_seq[v]
    end
    input_seq.sort!

    if suits.uniq.count == 1 &&
      values.include?(:A) &&
      values.include?(:king) &&
      values.include?(:queen) &&
      values.include?(:jack) &&
      values.include?(:ten)

      return 10 #royal flush

    elsif suits.uniq.count == 1 &&
      all_cards_seq.values.join("").include?(input_seq.join(""))

      return 9 #straight flush

    elsif vsort[0..3].uniq.count == 1 || vsort[1..4].uniq.count == 1

      return 8 #4 of a kind

    elsif (vsort[0..2].uniq.count == 1 && vsort[3..4].uniq.count == 1) ||
        (vsort[0..1].uniq.count == 1 && vsort[2..4].uniq.count == 1)

      return 7 # 3 of kind with a pair - full house

    elsif suits.uniq.count == 1

      return 6 # same suit - flush

    elsif all_cards_seq.values.join("").include?(input_seq.join(""))

      return 5 # straight but not in sequence - straight

    elsif vsort[0..2].uniq.count == 1 || vsort[2..4].uniq.count == 1

      return 4 # three of a kind

    elsif values.uniq.count == 3
          # (vs[0] == vs[1] && vs[2] == vs[3]) ||
          # (vs[1] == vs[2] && vs[3] == vs[4]) ||
          # (vs[0] == vs[1] && vs[3] == vs[4])

      return 3 # 2 pairs

    elsif values.uniq.count == 4

      return 2 # 1 pair

    else

      return 1
    end
  end

    def msg(rank)
      if rank == 10
        puts "Royal Flush! (rank 1)"
      elsif  rank == 9
        puts "Straight Flush (rank 2)"
      elsif rank == 8  
        puts "4 of a kind! (rank 3)"
      elsif rank == 7
        puts "3 of a kind with a pair! (rank 4)"
      elsif rank == 6
        puts "Flush! - same suit (rank 5)"
      elsif rank ==5
        puts "Straight! (rank 6)"
      elsif rank == 4
        puts "Three of a kind (rank 7)"
      elsif rank == 3
        puts "2 pairs! (rank 8)"
      elsif rank == 2
        puts "1 pair! (rank 9)"
      elsif rank == 1
        puts "Highest card! (rank 10)"
      end
    end

end
