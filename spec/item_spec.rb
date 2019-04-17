require_relative '../src/item'
require_relative '../src/item_type'
require_relative '../src/item_quality'

RSpec.describe Item do

  it 'should update sell in when item is updated' do
    item = Item.new(200, ItemQuality.new(50), ItemType::NORMAL)
    item.update
    expect(item.sell_in).to eq(199)
  end

  it 'should not update sell_in when item is legendary' do
    item = Item.new(200, ItemQuality.new(50), ItemType::LEGENDARY)
    item.update
    expect(item.sell_in).to eql(200)
  end

  it 'should not update sell_in when sell_in is 0' do
    item = Item.new(0, ItemQuality.new(50), ItemType::NORMAL)
    item.update
    expect(item.sell_in).to eql(0)
  end

  it 'should throw error if not a valid item type' do
    expect {Item.new(0, ItemQuality.new(50), 'invalid')}.to raise_error('Not a valid item type')
  end

  it 'should not decrease quality if quality is 0' do
    item = Item.new(50, ItemQuality.new(0), ItemType::NORMAL)
    item.update
    expect(item.quality.quality).to eql(0)
  end

  it 'should decrease quality by 1 when normal' do
    item = Item.new(10, ItemQuality.new(50), ItemType::NORMAL)
    item.update
    expect(item.quality.quality).to eql(49)
  end

  it 'should decrease quality by 2 when normal and sell_in date is 0' do
    item = Item.new(0, ItemQuality.new(50), ItemType::NORMAL)
    item.update
    expect(item.quality.quality).to eql(48)
  end

  it 'should not update if Legendary' do
    item = Item.new(10, ItemQuality.new(50), ItemType::LEGENDARY)
    item.update
    expect(item.quality.quality).to eql(50)
  end

  it 'should increase quality if Reverse' do
    item = Item.new(10, ItemQuality.new(20), ItemType::REVERSE)
    item.update
    expect(item.quality.quality).to eql(21)
  end

  it 'should stop increasing quality if quality is 50' do
    item = Item.new(10, ItemQuality.new(50), ItemType::REVERSE)
    item.update
    expect(item.quality.quality).to eql(50)
  end

  it 'should decrease quality twice if type is Conjured' do
    item = Item.new(10, ItemQuality.new(50), ItemType::CONJURED)
    item.update
    expect(item.quality.quality).to eql(48)
  end

  it 'should drop quality to 0 is sell_in date is passed if Passes type' do
    item = Item.new(0, ItemQuality.new(50), ItemType::PASSES)
    item.update
    expect(item.quality.quality).to eql(0)
  end

  it 'should increase the quality by 1 if sell_in date is > 10 for Passes type' do
    item = Item.new(12, ItemQuality.new(20), ItemType::PASSES)
    item.update
    expect(item.quality.quality).to eql(21)
  end

  it 'should increase the quality by 2 if sell_in date is < 10 but > 5 for Passes type' do
    item = Item.new(9, ItemQuality.new(20), ItemType::PASSES)
    item.update
    expect(item.quality.quality).to eql(22)
  end

  it 'should increase the quality by 2 if sell_in date is = 10 for Passes type' do
    item = Item.new(11, ItemQuality.new(20), ItemType::PASSES) # 11 as initially sell_in is decreased
    item.update
    expect(item.quality.quality).to eql(22)
  end

  it 'should increase the quality by 3 if sell_in date is < 5 but > 0 for Passes type' do
    item = Item.new(4, ItemQuality.new(20), ItemType::PASSES)
    item.update
    expect(item.quality.quality).to eql(23)
  end

  it 'should increase the quality by 3 if sell_in date is = 5 for Passes type' do
    item = Item.new(6, ItemQuality.new(20), ItemType::PASSES) # 6 as initially sell_in is decreased
    item.update
    expect(item.quality.quality).to eql(23)
  end
end