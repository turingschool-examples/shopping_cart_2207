require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
    context 'Iteration 2' do
        it 'exists' do
            cart = ShoppingCart.new("King Soopers", "30items")
            expect(cart).to be_an_instance_of(ShoppingCart)
        end

        it 'has a name and capacity and is empty' do
            cart = ShoppingCart.new("King Soopers", "30items")

            expect(cart.name).to eq("King Soopers")
            expect(cart.capacity).to eq("30items")
            expect(cart.products).to eq([])
        end

        it 'can hold products' do
            cart = ShoppingCart.new("King Soopers", "30items")
            product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
            product2 = Product.new(:meat, 'chicken', 4.50, '2')

            cart.add_product(product1)
            cart.add_product(product2)

            expect(cart.products).to eq([product1, product2])

            cart_details = {name: "King Soopers", capacity: 30}
            expect(cart.details).to eq(cart_details)
        end
    end

    context 'Iteration 3' do
        it 'can be full' do
            cart = ShoppingCart.new("King Soopers", "30items")
            product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
            product2 = Product.new(:meat, 'chicken', 4.50, '2')
            product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
            product4 = Product.new(:produce, 'apples', 0.99, '20')

            cart.add_product(product1)
            cart.add_product(product2)
            cart.add_product(product3)

            expect(cart.total_number_of_products).to eq(13)
            expect(cart.is_full?).to be(false)

            cart.add_product(product4)
            
            expect(cart.is_full?).to be(true)
        end

        it 'sorts products by category' do
            cart = ShoppingCart.new("King Soopers", "30items")
            product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
            product2 = Product.new(:meat, 'chicken', 4.50, '2')
            product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
            product4 = Product.new(:produce, 'apples', 0.99, '20')

            cart.add_product(product1)
            cart.add_product(product2)
            cart.add_product(product3)
            cart.add_product(product4)

            expect(cart.products_by_category(:paper)).to eq([product1, product3])
        end
    end

    context 'Iteration 4' do
        it 'can tell how occupied it is by percentage' do
            cart = ShoppingCart.new("King Soopers", "30items")
            product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
            product2 = Product.new(:meat, 'chicken', 4.50, '2')
            product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

            cart.add_product(product1)
            cart.add_product(product2)
            cart.add_product(product3)

            expect(cart.percentage_occupied).to eq(43.33)
        end

        it 'sorts products by quantity' do
            cart = ShoppingCart.new("King Soopers", "30items")
            product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
            product2 = Product.new(:meat, 'chicken', 4.50, '2')
            product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
            product4 = Product.new(:produce, 'apples', 0.99, '20')

            cart.add_product(product1)
            cart.add_product(product2)
            cart.add_product(product3)
            cart.add_product(product4)

            expect(cart.sorted_products_by_quantity).to eq([product4, product1, product2, product3])
        end

        it 'has a product breakdown' do
            cart = ShoppingCart.new("King Soopers", "30items")
            product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
            product2 = Product.new(:meat, 'chicken', 4.50, '2')
            product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
            product4 = Product.new(:produce, 'apples', 0.99, '20')

            cart.add_product(product1)
            cart.add_product(product2)
            cart.add_product(product3)
            cart.add_product(product4)

            product_breakdown = {:meat=>[product2],
                                :paper=> [product1, product3],
                                :produce=> [product4]}
                                
            expect(cart.product_breakdown).to eq(product_breakdown)
        end
    end
end