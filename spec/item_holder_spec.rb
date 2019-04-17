require_relative '../src/item_holder'
require_relative '../src/item_type_manager'

RSpec.describe ItemHolder do

  it 'should update sell in when item is updated' do
    holder = ItemHolder.new(200, 50, ItemTypeManager::NORMAL)
    holder.update
    expect(holder.item.sell_in).to eq(199)
  end

  it 'should not update sell_in when item is legendary' do
    holder = ItemHolder.new(200, 50, ItemTypeManager::LEGENDARY)
    holder.update
    expect(holder.item.sell_in).to eql(200)
  end

  it 'should not update sell_in when sell_in is 0' do
    holder = ItemHolder.new(0, 50, ItemTypeManager::NORMAL)
    holder.update
    expect(holder.item.sell_in).to eql(0)
  end

  it 'should throw error if not a valid item type' do
    expect {ItemHolder.new(0, 50, 'invalid')}.to raise_error('Not a valid item type')
  end

  it 'should not decrease quality if quality is 0' do
    holder = ItemHolder.new(50, 0, ItemTypeManager::NORMAL)
    holder.update
    expect(holder.item.quality).to eql(0)
  end

  it 'should decrease quality by 1 when normal' do
    holder = ItemHolder.new(10, 50, ItemTypeManager::NORMAL)
    holder.update
    expect(holder.item.quality).to eql(49)
  end

  it 'should decrease quality by 2 when normal and sell_in date is 0' do
    holder = ItemHolder.new(0, 50, ItemTypeManager::NORMAL)
    holder.update
    expect(holder.item.quality).to eql(48)
  end

  it 'should not update if Legendary' do
    holder = ItemHolder.new(10, 50, ItemTypeManager::LEGENDARY)
    holder.update
    expect(holder.item.quality).to eql(50)
  end

  it 'should increase quality if Reverse' do
    holder = ItemHolder.new(10, 20, ItemTypeManager::REVERSE)
    holder.update
    expect(holder.item.quality).to eql(21)
  end

  it 'should stop increasing quality if quality is 50' do
    holder = ItemHolder.new(10, 50, ItemTypeManager::REVERSE)
    holder.update
    expect(holder.item.quality).to eql(50)
  end

  it 'should decrease quality twice if type is Conjured' do
    holder = ItemHolder.new(10, 50, ItemTypeManager::CONJURED)
    holder.update
    expect(holder.item.quality).to eql(48)
  end

  it 'should drop quality to 0 is sell_in date is passed if Passes type' do
    holder = ItemHolder.new(0, 50, ItemTypeManager::PASSES)
    holder.update
    expect(holder.item.quality).to eql(0)
  end

  it 'should increase the quality by 1 if sell_in date is > 10 for Passes type' do
    holder = ItemHolder.new(12, 20, ItemTypeManager::PASSES)
    holder.update
    expect(holder.item.quality).to eql(21)
  end

  it 'should increase the quality by 2 if sell_in date is < 10 but > 5 for Passes type' do
    holder = ItemHolder.new(9, 20, ItemTypeManager::PASSES)
    holder.update
    expect(holder.item.quality).to eql(22)
  end

  it 'should increase the quality by 2 if sell_in date is = 10 for Passes type' do
    holder = ItemHolder.new(11, 20, ItemTypeManager::PASSES) # 11 as initially sell_in is decreased
    holder.update
    expect(holder.item.quality).to eql(22)
  end

  it 'should increase the quality by 3 if sell_in date is < 5 but > 0 for Passes type' do
    holder = ItemHolder.new(4, 20, ItemTypeManager::PASSES)
    holder.update
    expect(holder.item.quality).to eql(23)
  end

  it 'should increase the quality by 3 if sell_in date is = 5 for Passes type' do
    holder = ItemHolder.new(6, 20, ItemTypeManager::PASSES) # 6 as initially sell_in is decreased
    holder.update
    expect(holder.item.quality).to eql(23)
  end
end