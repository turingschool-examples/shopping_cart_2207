require 'rspec'
require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do 
    before :each do 
      @cart = ShoppingCart.new("King Soopers", "30items") 
       @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
       @product2 = Product.new(:meat, 'chicken', 4.50, '2') 
       @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
       @product4 = Product.new(:produce, 'apples', 0.99, '20')
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
        expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
    end

    # ITERATION Three(3)

    it 'display total number of products in cart & see if cart is full' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)

        expect(@cart.total_number_of_products).to eq(13)
        expect(@cart.is_full?).to eq(false)
    end

    it 'can now see if cart is full?' do 
         @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)
        @cart.add_product(@product4)
        expect(@cart.is_full?).to eq(true)
    end

    it 'can show products by category' do 
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)
        @cart.add_product(@product4)
        expect(@cart.products_by_category(:paper)).to eq([@product1, @product3])
    end


end
