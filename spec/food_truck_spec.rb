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

  describe '#potential_revenue' do
    it "calculates a food truck's potential_revenue" do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      food_truck.stock(item1, 35)
      food_truck.stock(item2, 7)

      expect(food_truck.potential_revenue).to eq 148.75
    end
  end

  describe '#items_available' do
    it 'returns all items available for FoodTruck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      food_truck.stock(item1, 35)
      food_truck.stock(item2, 7)

      expected = [item1, item2]
      expect(food_truck.items_available).to eq expected
    end
  end
end
