class Item
  attr_reader :name

  def initialize(details)
    @name = details[:name]
    @price = details[:price]
  end

  def price
    @price.delete_prefix('$').to_f
  end
end
