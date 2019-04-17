class ItemType
  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update
    update_sell_in
    update_quality
  end

  def update_sell_in;end

  def update_quality;end


  def increase_quality(times)
    @quality += times if @quality < 50
  end

  def decrease_quality(times)
    @quality -= times if @quality.positive?
  end

  def sell_date_passed
    @sell_in.zero?
  end
end