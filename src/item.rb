class Item
  attr_reader :sell_in, :quality, :type

  def initialize(sell_in, quality, type)
    @sell_in = sell_in
    @quality = quality
    @type = type
    raise('Not a valid item type') if ItemType.not_valid_item_type(type)
  end

  def update
    update_sell_in
    update_quality
  end

  private

  def update_quality

  end

  def update_sell_in
    @sell_in -= 1 if @sell_in.positive? && @type != ItemType::LEGENDARY
  end
end