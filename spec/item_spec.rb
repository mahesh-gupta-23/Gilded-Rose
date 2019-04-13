require_relative '../src/item'
require_relative '../src/item_type'

RSpec.describe Item do

  it 'should update sell in when item is updated' do
    item = Item.new(200, 50, ItemType::NORMAL)
    item.update
    expect(item.sell_in).to eq(199)
  end

  it 'should not update sell_in when item is legendary' do
    item = Item.new(200, 50, ItemType::LEGENDARY)
    item.update
    expect(item.sell_in).to eql(200)
  end
end