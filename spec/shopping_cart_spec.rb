require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do

    it 'exists' do
        cart = ShoppingCart.new("King Soopers", "30items")
       expect(cart).to be_an_instance_of(ShoppingCart) 
    end
    
    it 'has a name'do
    cart = ShoppingCart.new("King Soopers", "30items")
        expect(cart.name).to eq('King Soopers')
    end

    it 'has a capacity' do
        cart = ShoppingCart.new("King Soopers", "30items")
        expect(cart.capacity).to eq(30)
    end

    it 'initially contains no products' do
        cart = ShoppingCart.new("King Soopers", "30items")
        expect(cart.products).to eq([])
    end

    it 'can add products to cart' do
        cart = ShoppingCart.new("King Soopers", "30items")
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        cart.add_product(product1)
        cart.add_product(product2)

        expect(cart.products).to eq([product1, product2])
    end

    it 'has cart details - name and capacity' do
        cart = ShoppingCart.new("King Soopers", "30items")
        expect(cart.details).to eq({name: "King Soopers", capacity: 30})
    end 
        
    it 'can view the total number of products in the cart' do
        cart = ShoppingCart.new("King Soopers", "30items")
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)

        expect(cart.total_number_of_products).to eq(13)
    end

    it 'cart is not full until its over capacity' do
        cart = ShoppingCart.new("King Soopers", "30items")
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

        expect(cart.is_full?).to eq(false)
    end

    it 'can check if cart is full' do
        cart = ShoppingCart.new("King Soopers", "30items")
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
        product4 = Product.new(:produce, 'apples', 0.99, '20')
        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)
        cart.add_product(product4)

        expect(cart.is_full?).to eq(true)
    end
    
    it 'can find products of a given category' do
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

    it 'can calculate percentage of cart that is full' do
        cart = ShoppingCart.new("King Soopers", "30items")
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)

        expect(cart.percentage_occupied).to eq(43.33)
    end
end