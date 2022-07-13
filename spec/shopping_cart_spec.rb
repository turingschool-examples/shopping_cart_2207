require 'rspec'
require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do 
    before :each do 
      @cart = ShoppingCart.new("King Soopers", "30items") 
       @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
       @product2 = Product.new(:meat, 'chicken', 4.50, '2') 
    end
    it 'exists' do 
        expect(@cart).to be_a(ShoppingCart)
    end

    it 'has attributes..' do 
        expect(@cart.name).to eq('King Soopers')
        expect(@cart.capacity).to eq('30')
        expect(@cart.products).to eq([])
    end

    it 'can add items to products array..' do 
        @cart.add_product(@product1)
        @cart.add_product(@product2)

        expect(@cart.products). to eq([@product1,@product2])
    end

    it 'can show the cart details in hash ..' do 
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
    end
end