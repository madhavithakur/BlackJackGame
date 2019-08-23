require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    hand.hit(deck) while !hand.busted? && hand.points < 17
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    bets.keys.each {|player| player.pay_winnings(2*bets[player]) if player.hand.beats?(self.hand)}
  end
end
