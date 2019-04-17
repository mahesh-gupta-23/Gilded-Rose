class ItemHolder
  attr_reader :item

  def initialize(sell_in, quality, type)
    raise('Not a valid item type') if ItemTypeManager.not_valid_item_type(type)
    @item = ItemTypeManager.item(type, sell_in, quality)
  end

  def update
    @item.update
  end
end
