class ReverseItem < ItemType

  def update_sell_in
    @sell_in -= 1 if @sell_in.positive?
  end

  def update_quality
    increase_quality(1)
  end
end
