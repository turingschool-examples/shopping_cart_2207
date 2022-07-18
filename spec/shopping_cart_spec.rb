require './lib/shopping_cart'
require './lib/product'

RSpec.describe ShoppingCart do 
    let(:cart) { ShoppingCart.new("King Soopers", "30items")}

    it 'exists' do
        expect(cart).to be_instance_of(ShoppingCart)
        expect(cart.name).to eq("King Soopers")
        expect(cart.capacity).to eq(30)
        expect(cart.products).to eq([])
    end

    it 'can add products to cart' do
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')

        cart.add_product(product1)
        cart.add_product(product2)

        expect(product1).to be_instance_of(Product)
        expect(product2).to be_instance_of(Product)
        expect(cart.products.count).to eq(2)
        expect(cart.details).to eq({name: "King Soopers", capacity: 30})
    end

    it 'can count number of products in cart' do
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)
    
        expect(cart.total_number_of_products).to eq(13)
        expect(cart.is_full?).to be false
    end

    it 'can have a full cart' do 
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
        product4 = Product.new(:produce, 'apples', 0.99, '20')

        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)
        cart.add_product(product4)
        
        expect(cart.is_full?).to be true
    end

    it 'can sort products by category' do
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

    it 'can calculate percentage occupied' do
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)

        expect(cart.percentage_occupied).to eq 43.33
    end

    it 'can sort products by quantity' do
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

    xit 'can give a breakdown of products' do
        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2')
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
        product4 = Product.new(:produce, 'apples', 0.99, '20')

        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)
        cart.add_product(product4)

        expect(cart.product_breakdown).to eq({
            meat: [product2],
            paper: [product1, product3],
            produce: [product4]
        }) 
    end


end



