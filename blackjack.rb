require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'

new_deck = Deck.new

player_hand = Hand.new
dealer_hand = Hand.new

2.times do
  player_hand.hit(new_deck)
end

player_hand.cards.each do |card|
  puts "Player was dealt: #{card.suit} #{card.value}"
end
puts "Player's score: #{player_hand.score}"




while player_hand.score < 22

  print "\nHit or stand (H/S): "
  input = gets.chomp
  puts ""
  if input == 'h'
    player_hand.hit(new_deck)
    puts "Player was dealt: #{player_hand.cards.last.suit} #{player_hand.cards.last.value}"
    puts "Player's score: #{player_hand.score}"
    if player_hand.bust?
      puts "\nBust! You lose..."
    end

  elsif input == 's'
    puts "Player's score: #{player_hand.score}"
    puts "\n"
    2.times do
      dealer_hand.hit(new_deck)
    end

    dealer_hand.cards.each do |card|
      puts "Dealer was dealt: #{card.suit} #{card.value}"
    end

    while dealer_hand.stay?
      dealer_hand.hit(new_deck)
      puts "Dealer was dealt: #{dealer_hand.cards.last.suit} #{dealer_hand.cards.last.value}"

    end
    if dealer_hand.bust?
      puts "Dealer's score: #{dealer_hand.score}"
      puts "\nThe Dealer has busted."
    else
      puts "Dealer's score: #{dealer_hand.score}"
      puts "\nDealer Stands"
    end

    if player_hand.score > dealer_hand.score
      puts "\nPlayer wins!"
    elsif
      dealer_hand.score > player_hand.score && dealer_hand.score < 21
      puts "\nDealer wins!"
    elsif player_hand.score ==dealer_hand.score
      puts "\nTie!"
    end
    break

  else
    puts "Invalid entry, please hit or stay (input h or s)"
  end
end
