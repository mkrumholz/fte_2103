require 'rspec'
require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  describe '::new' do
    it 'exists' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).is_a? FoodTruck
    end

    it 'has a name' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.name).to eq "Rocky Mountain Pies"
    end

    it 'has no inventory to start' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.inventory).to eq Hash.new
    end
  end

  describe '#check_stock' do
    it 'returns 0 if none of specified item in inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq 0
    end
  end

  describe '#stock' do
    it 'adds specified num of item to inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      food_truck.stock(item1, 30)

      expect(food_truck.check_stock(item1)).to eq 30

      food_truck.stock(item1, 25)

      expect(food_truck.check_stock(item1)).to eq 55
    end
  end
end
