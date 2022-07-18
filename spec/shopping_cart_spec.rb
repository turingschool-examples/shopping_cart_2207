require 'rspec'
require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do

    before do
        @cart = ShoppingCart.new("King Soopers", "30items")
    end

    it 'exists' do
        expect(@cart).to be_instance_of ShoppingCart
    end
  
    it 'Cart has a name' do
        expect(@cart.name).to eq 'King Soopers'
     end
  
    it 'Cart has capacity' do
        expect(@cart.capacity).to eq(30)
     end  

    it 'Cart has products' do
        expect(@cart.products).to eq([])
    end  

    it 'can add products to cart' do
        @cart.add_product(@product1 = Product.new(:paper, 'toilet paper', 3.70, '10'))
        @cart.add_product(@product2 = Product.new(:meat, 'chicken', 4.50, '2'))
        expect(@cart.products).to eq([@product1, @product2])
    end

    it 'can print cart details' do
        expect(@cart.details).to be_a Hash
    end
#### 3 ###
    it 'can add products to cart' do
        @cart.add_product(@product1 = Product.new(:paper, 'toilet paper', 3.70, '10'))
        @cart.add_product(@product2 = Product.new(:meat, 'chicken', 4.50, '2'))
        @cart.add_product(@product3 = Product.new(:paper, 'tissue paper', 1.25, '1'))
        expect(@cart.products).to eq([@product1, @product2, @product3])
    end

    it 'identifies number of items in cart'

    

    it 'can identify if cart is full' do
        expect (@cart.is_full?).to be false
    end 

end



