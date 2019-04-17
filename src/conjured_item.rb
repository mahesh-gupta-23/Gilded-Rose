class ConjuredItem < ItemType

  def update_sell_in
    @sell_in -= 1 if @sell_in.positive?
  end

  def update_quality
    decrease_quality(2)
  end
end
