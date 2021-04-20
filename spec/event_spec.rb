require 'rspec'
require './lib/event'
require './lib/food_truck'
require './lib/item'

describe Event do
  describe '::new' do
    it 'exists' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event).is_a? Event
    end

    it 'has a name' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event.name).to eq "South Pearl Street Farmers Market"
    end

    it 'has no food trucks to start' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event.food_trucks).to eq []
    end
  end
end
