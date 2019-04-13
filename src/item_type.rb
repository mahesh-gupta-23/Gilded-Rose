class ItemType
  NORMAL = 'NORMAL'.freeze # Decrease quality by 1
  LEGENDARY = 'LEGENDARY'.freeze # Do not decrease quality nor sell_in
  REVERSE = 'REVERSE'.freeze # Increase quality as sell in approaches
  REVERSE_ZERO = 'REVERSE_ZERO'.freeze # Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less
  DOUBLE = 'DOUBLE'.freeze # Quality decrease by 2

  def self.not_valid_item_type(type)
    ![NORMAL, LEGENDARY, REVERSE, REVERSE_ZERO, DOUBLE].include? type
  end
end
