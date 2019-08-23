require "byebug"

class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    cards.each do |card| 
      begin
        sum += card.blackjack_value
      rescue
        # debugger
        sum += 11
        sum -= 10 if sum > 21
      end
    end
    sum
  end

  def busted?
    #debugger
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    cards.push(deck.take(1).first)
  end

  def beats?(other_hand)
    #debugger
    return false if busted?
    if self.points > other_hand.points || other_hand.busted?
      return true
    else 
      return false
    end
  end

  def return_cards(deck)
    deck.return(cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
