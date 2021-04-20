require 'rspec'
require './lib/item'

describe Item do
  describe '::new' do
    it 'exists' do
      item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item).is_a? Item
    end

    it 'has a name' do
      item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item.name).to eq 'Peach Pie (Slice)'
    end

    it 'has a price' do
      item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item.price).to eq 3.75
    end
  end
end
