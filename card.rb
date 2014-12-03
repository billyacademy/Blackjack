class Card

  attr_reader :value, :suit
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def ranks
    if ace?
      11
    elsif facecard?
      10
    else
      value.to_i
    end
  end

  def facecard?
    ['J', 'Q', 'K'].include?(value)
  end

  def ace?
    value == 'A'
  end

end
