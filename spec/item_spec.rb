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

  it 'should not update sell_in when sell_in is 0' do
    item = Item.new(0, 50, ItemType::NORMAL)
    item.update
    expect(item.sell_in).to eql(0)
  end

  it 'should throw error if not a valid item type' do
    expect {Item.new(0, 50, 'invalid')}.to raise_error('Not a valid item type')
  end

  it 'should not decrease quality' do
    item = Item.new(0, 50, ItemType::NORMAL)
    item.update
    expect(item.quality).to eql(49)
  end

  it 'should update decrease quality by 1 when normal' do
    item = Item.new(0, 50, ItemType::NORMAL)
    item.update
    expect(item.quality).to eql(49)
  end
end