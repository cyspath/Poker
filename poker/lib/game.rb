require_relative 'deck'
require_relative 'player'
require 'io/console'

class Game

	def initialize
		@players = [Player.new("You", 100), Player.new("Tiffany", 100), Player.new("Maggie", 100)]
		@pot = 0
		@deck = Deck.new
		@current_bet = 0

	end

	def run
		# intro
		players_dealt_5_cards
		# player_bet
		swap_cards
		compare_cards

		return nil
	end

	def compare_cards
		system "clear"
		pad
		check_everyones_cards # cheat mode
		pad
		
		winner = nil

		puts "checking your hand vs Tiffany's hand..."
		pad
		sleep 1
		if @players[0].hand.won_vs(@players[1].hand)
			winner = @players[0]
		else
			winner = @players[1]
		end

		if winner == @players[0]
			pad
			puts "checking your hand vs Maggie's hand..."
			pad
			sleep 1
			if @players[0].hand.won_vs(@players[2].hand)
				winner = @players[0]
			else
				winner = @players[1]
			end
		else
			pad
			puts "You, lost! Now checking Tiffany's hand vs Maggie's hand..."
			pad
			sleep 1
			if @players[1].hand.won_vs(@players[2].hand)
				winner = @players[1]
			else
				winner = @players[2]
			end
		end

		sleep 1
		pad
		puts "Winner is #{winner.name}! #{winner.name} takes all the money in the pot."


	end



	def swap_cards
		pad
		@players.each do |player|
			if player.name == "You"
				pad
				puts "Your cards:"
				player.hand.current.each { |card| puts "#{card.value} of #{card.suit} " }
				pad

				puts "Would you like to swap some cards? Y/N"
				input = gets.chomp.downcase
				next if input == "n"
				pad
				puts "Which cards do you want to swap?"

				cards = []
				while true
					input = gets
					break if input == "\n"

					if !["1","2","3","4","5"].include?(input.chomp)
						puts "please enter a integer between 1 to 5 followed by Enter key, hit enter twice to finish."
						next
					end
					cards << (input.chomp.to_i - 1)
					cards.uniq!
				end
				system "clear"
				pad 
				puts "removing your selected cards... "
				sleep 0.3
				pad
				player.hand.drop_cards(cards)
				puts "you now have:"
				player.hand.current.each { |card| puts "#{card.value} of #{card.suit} " }
				sleep 1.5
				system "clear"
				pad
				puts "adding new cards to your hand..."
				add_cards = @deck.remove_cards(cards.length)
				player.hand.receive_cards(add_cards)
				sleep 0.3
				pad
				puts "you now have 5 cards:"
				player.hand.current.each { |card| puts "#{card.value} of #{card.suit} " }
				pad
				next
			end

			sleep 0.8

			puts "#{player.name} folds - (AI not yet implemented)"
			pad
			
		end
		continue?
	end



	def player_bet
		@players.each do |player|
			if player.name == "You"
				pad
				puts "How much would you like to bet?"
				amt = gets.chomp.to_i
				pad
				print "You have bet $#{amt}"
				@current_bet = amt
				player.bet(amt)
				@pot += amt
				sleep 1
				puts "   Pot now has $#{@pot}"
				next
			end

			sleep 2
			pad
			bet = rand(10) * 10
			if bet <= @current_bet
				bet = @current_bet
				print "#{player.name} also bet $#{bet}"
			else
				print "#{player.name} raise to $#{bet}"
			end
			@current_bet = bet
			player.bet(bet)
			@pot += bet
			sleep 1
			puts "   Pot now has $#{@pot}"
		end

		continue?
	end

	def players_dealt_5_cards
		system "clear"
		pad
		puts "Dealing everyone 5 cards..."
		sleep 1

		@players.each do |player|
			five_cards = @deck.remove_cards(5)
			player.hand.receive_cards(five_cards)
		end
	end

	def check_everyones_cards
		pad
		@players.each do |player|
			puts "#{player.name}:"
			player.hand.current.each { |card| print "#{card.value} of #{card.suit}, " }
			puts
		end

		continue?
	end

	def continue?
		pad
		sleep 1
		puts "pressure Enter to continue"
		while true
			break if STDIN.getch == "\r"
		end
	end

	def intro
		system "clear"
		puts
		puts "Welome to Poker!"
		puts "You will be playing vs Tiffany and Maggie"
		puts "EVeryone will start with $100"
		sleep 1.5
	end

	def pad
		puts nil
	end


end
