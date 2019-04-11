require_relative '../src/item'

RSpec.describe Item do

  it 'should update sell in when item is updated' do
    item = Item.new(200, 50, "afjs")
    item.update
    expect(item.sell_in).to eq(199)
  end

end