require_relative 'item_type'

class NormalItem < ItemType

  def update_sell_in
    @sell_in -= 1 if @sell_in.positive?
  end

  def update_quality
    sell_date_passed ? decrease_quality(2) : decrease_quality(1)
  end
end
