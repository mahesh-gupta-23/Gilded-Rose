class Item
  attr_reader :sell_in, :item_quality, :type

  def initialize(sell_in, item_quality, type)
    @sell_in = sell_in
    @item_quality = item_quality
    @type = type
    raise('Not a valid item type') if ItemType.not_valid_item_type(type)
    @item_quality.type(type)
  end

  def update
    update_sell_in
    @item_quality.update
  end

  private

  def update_sell_in
    @sell_in -= 1 if @sell_in.positive? && @type != ItemType::LEGENDARY
  end
end