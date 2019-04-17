class ItemQuality
  attr_reader :quality

  def initialize(quality)
    @quality = quality
  end

  def update(sell_in, type)
    case type
    when ItemType::NORMAL
      update_normal_quality(sell_in)
    when ItemType::REVERSE
      update_reverse_quality
    when ItemType::PASSES
      update_passes_quality(sell_in)
    when ItemType::CONJURED
      update_conjured_quality
    end
  end

  def update_normal_quality(sell_in)
    sell_date_passed(sell_in) ? decrease_quality(2) : decrease_quality(1)
  end

  def update_reverse_quality
    increase_quality(1)
  end

  def update_passes_quality(sell_in)
    if sell_in.zero?
      @quality = 0
    elsif sell_in <= 5
      increase_quality(3)
    elsif sell_in <= 10
      increase_quality(2)
    else
      increase_quality(1)
    end
  end

  def update_conjured_quality
    decrease_quality(2)
  end

  def increase_quality(times)
    @quality += times if @quality < 50
  end

  def decrease_quality(times)
    @quality -= times if @quality.positive?
  end

  def sell_date_passed(sell_in)
    sell_in.zero?
  end
end
