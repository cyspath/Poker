require_relative 'hand'

class Player

	attr_accessor :name, :bank, :hand, :playing

	def initialize(name, amt)
		@name = name
		@bank = amt
		@hand = Hand.new
		@playing = true
	end

	def bet(amt)
		@bank -= amt
	end

	def see(amt)
		bet(amt) # basically same
	end

	def raise(amt)
		@bank -= amt
	end

	def fold
		@playing = false # not playing anymore
	end

end
