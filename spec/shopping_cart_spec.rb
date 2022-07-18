require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
    let(:cart) { ShoppingCart.new("King Soopers", "30items")}
    let(:product1) { Product.new(:paper, "toilet paper", 3.70, "10")}
    let(:product2) { Product.new(:meat, "chicken", 4.50, "2")}
    let(:product3) { Product.new(:paper, 'tissue paper', 1.25, "1")}
    let(:product4) { Product.new(:produce, 'apples', 0.99, '20')}
    context 'Iteration 2: Shopping Cart' do

        it 'has a name' do
            expect(cart.name).to eq "King Soopers"
        end

        it 'has a maximum capacity' do
            expect(cart.capacity).to eq 30
        end

        it 'can add contents and return their values' do
            expect(cart.products).to eq []
            cart.add_product(product1)
            cart.add_product(product2)
            expect(cart.products).to eq [product1, product2]
        end

        it 'can describe its qualities as a hash' do
            expect(cart.details).to eq({name: "King Soopers", capacity: 30})
        end
    end


    context 'Iteration 3' do
        before :each do
            cart.add_product(product1)
            cart.add_product(product2)
            cart.add_product(product3)
        end

        it 'can tell whether it is full' do
            expect(cart.total_number_of_products).to eq 13
            expect(cart.is_full?).to eq false

            cart.add_product(product4)

            expect(cart.is_full?).to eq true
        end

        it 'can return its contents by category' do
            expect(cart.products_by_category(:paper)).to eq [product1, product3]
        end
    end
end








