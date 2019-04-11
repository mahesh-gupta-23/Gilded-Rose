class Item
  attr_reader :sell_in, :quality, :type

  def initialize(sell_in, quality, type)
    @sell_in = sell_in
    @quality = quality
    @type = type
  end


  def update
    update_sell_in
    update_quality
  end

  private

  def update_quality

  end

  def update_sell_in
    @sell_in -= 1 if @sell_in > 0
  end
end