require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
    context 'Iteration 2: Shopping Cart' do
        let(:cart) { ShoppingCart.new("King Soopers", "30items")}
        let(:product1) { Product.new(:paper, "toilet paper", 3.70, "10")}
        let(:product2) { Product.new(:meat, "chicken", 4.50, "2")}

        it 'has a name' do
            expect(cart.name).to eq "King Soopers"
        end

        it 'has a maximum capacity' do
            expect(cart.capacity).to eq 30
        end

        it 'can return its contents' do
            expect(cart.products).to eq []
            cart.add_product(product1)
            cart.add_product(product2)
            expect(cart.products).to eq [product1, product2]
        end

        it 'can describe its qualities as a hash' do
            expect(cart.details).to eq({name: "King Soopers", capacity: 30})
        end
    end
end





