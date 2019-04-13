# frozen_string_literal: true

class Item
  attr_reader :sell_in, :quality, :type

  def initialize(sell_in, quality, type)
    @sell_in = sell_in
    @quality = quality
    @type = type
    raise('Not a valid item type') if ItemType.not_valid_item_type(type)
  end

  def update
    update_sell_in
    update_quality
  end

  private

  def update_sell_in
    @sell_in -= 1 if @sell_in.positive? && @type != ItemType::LEGENDARY
  end

  def update_quality
    case @type
    when ItemType::NORMAL
      update_normal_quality
    when ItemType::REVERSE
      update_reverse_quality
    when ItemType::PASSES
      update_passes_quality
    when ItemType::CONJURED
      update_conjured_quality
    end
  end

  def update_normal_quality
    sell_date_passed ? decrease_quality(2) : decrease_quality(1)
  end

  def update_reverse_quality
    increase_quality(1)
  end

  def update_passes_quality
    if @sell_in.zero?
      @quality = 0
    elsif @sell_in <= 5
      increase_quality(3)
    elsif @sell_in <= 10
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

  def sell_date_passed
    @sell_in.zero?
  end
end
