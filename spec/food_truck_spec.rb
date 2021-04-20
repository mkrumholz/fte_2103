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
    it 'returns num of specified item in inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq 0
    end
  end
end
