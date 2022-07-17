require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
    context 'Iteration 2' do
        before :each do
            @cart = ShoppingCart.new("King Soopers", "30items")
            @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
            @product2 = Product.new(:meat, 'chicken', 4.50, '2')  
        end

        it 'exists' do
            expect(@cart).to be_an_instance_of(ShoppingCart)
        end

        it 'can return cart name' do
            expect(@cart.name).to eq('King Soopers')
        end

        it 'can return cart capacity' do
            expect(@cart.capacity).to eq(30)
        end

        it 'can return empty array of cart products' do
            expect(@cart.products).to eq([])
        end

        it 'can add products' do
            @cart.add_product(@product1)
            @cart.add_product(@product2)
            expect(@cart.products.count).to eq(2)
        end

        it 'can return the cart details for name and capacity' do
            expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
        end
    end
end