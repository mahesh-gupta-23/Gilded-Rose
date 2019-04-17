require_relative '../src/normal_item'
require_relative '../src/legendary_item'
require_relative '../src/reverse_item'
require_relative '../src/pass_item'
require_relative '../src/conjured_item'
require_relative '../src/item_type'

class ItemTypeManager
  NORMAL = 'NORMAL'.freeze # Decrease quality by 1
  LEGENDARY = 'LEGENDARY'.freeze # Do not decrease quality nor sell_in
  REVERSE = 'REVERSE'.freeze # Increase quality as sell in approaches
  PASSES = 'PASSES'.freeze # Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less
  CONJURED = 'CONJURED'.freeze # Quality decrease by 2

  def self.not_valid_item_type(type)
    ![NORMAL, LEGENDARY, REVERSE, PASSES, CONJURED].include? type
  end

  # @return [ItemType]
  def self.item(type, sell_in, quality)
    case type
    when NORMAL
      NormalItem.new(sell_in, quality)
    when LEGENDARY
      LegendaryItem.new(sell_in, quality)
    when REVERSE
      ReverseItem.new(sell_in, quality)
    when PASSES
      PassItem.new(sell_in, quality)
    when CONJURED
      ConjuredItem.new(sell_in, quality)
    end
  end
end

