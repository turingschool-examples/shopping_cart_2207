require 'rspec'
require './lib/product'

describe Product do
  context 'Iteration 1' do
    let(:product1) { Product.new(:paper, 'toilet paper', 3.70, '10') }
    xit 'Product exists' do
      expect(product1).to be_an_instance_of Product
    end

    xit 'Product has a category' do
      expect(product1.category).to eq :paper
    end

    xit 'Product has a name' do
      expect(product1.name).to eq 'toilet paper'
    end

    xit 'Product has a unit price' do
      expect(product1.unit_price).to eq 3.70
    end

    xit 'Product has a quantity' do
      expect(product1.quantity).to eq 10
    end

    xit 'Product can calculate total price' do

      product2 = Product.new(:meat, 'chicken', 4.50, '2')

      expect(product1.total_price).to eq 37.0
      expect(product2.total_price).to eq 9.0
    end

    xit 'Product can be hoarded' do

      expect(product1.hoarded?).to eq false
      product1.hoard
      expect(product1.hoarded?).to eq true
    end


  end
end
