class ItemQuality
  attr_reader :quality, :type

  def initialize(quality)
    @quality = quality
  end

  def type(type)
    @type = type
  end

  def update
    update_normal if @type == ItemType::NORMAL
  end

  private

  def update_normal
    @quality -= 1 if @quality.positive?
  end
end
