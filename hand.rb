class Hand
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
  end

  def hit(deck)
    cards << deck.draw
  end

  def score
    ace_array = []
    sum_array = []
    sum = 0

    @cards.each do |card|
      if card.ace?
        ace_array << card
        sum += 0
      elsif card.facecard?
        sum += 10
      else
        sum += card.value.to_i
      end
      sum
    end

    sum_array = ace_array << sum
    ace_array.reverse!
    ace_array.each do |count|

      if count.class == Fixnum
        sum = count
      elsif sum + 11 > 21
        sum += 1
      else
        sum += 11
      end
    end
    sum
  end

  def stay?
    self.score <= 16
  end

  def bust?
    self.score > 21
  end
  @hand
end
