require 'rspec'
require './lib/food_truck'

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

      expect(food_truck.inventory).to eq {}
    end
  end
end
