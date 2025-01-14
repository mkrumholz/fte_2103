class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory[item] > 0
    end
  end

  def total_quantity(item)
    food_trucks_that_sell(item).sum do |truck|
      truck.inventory[item]
    end
  end

  def all_items
    items = @food_trucks.each_with_object([]) do |food_truck, item_list|
      item_list << food_truck.items_available
    end.flatten
    items.uniq
  end

  def sorted_item_list
    all_items.map { |item| item.name }.sort
  end

  def total_inventory
    all_items.each_with_object({}) do |item, inventory_hash|
      inventory_hash[item] = {quantity: 0, food_trucks: []}
      inventory_hash[item][:quantity] = total_quantity(item)
      inventory_hash[item][:food_trucks] = food_trucks_that_sell(item)
    end
  end

  def overstocked_items
    all_items.find_all do |item|
      overstocked?(item)
    end
  end

  def overstocked?(item)
    food_trucks_that_sell(item).length > 1 && total_quantity(item) > 50
  end
end
