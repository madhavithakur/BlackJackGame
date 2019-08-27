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
    points = 0
    @cards.each do |card|
      begin
        points += card.blackjack_value
      rescue => exception
        points += 11
       points -= 10 if points > 21
      end
    end 
    points
  end

  def busted?
   points > 21
  end

  def hit(deck)
    if busted?
    raise "already busted" 
    else
    @cards += deck.take(1)
  end
end

  def beats?(other_hand)
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
    
  end
end
