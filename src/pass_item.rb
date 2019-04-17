class PassItem < ItemType

  def update_sell_in
    @sell_in -= 1 if @sell_in.positive? && @type != ItemTypeManager::LEGENDARY
  end

  def update_quality()
    if @sell_in.zero?
      @quality = 0
    elsif @sell_in <= 5
      increase_quality(3)
    elsif @sell_in <= 10
      increase_quality(2)
    else
      increase_quality(1)
    end
  end
end
