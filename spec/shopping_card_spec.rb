require './lib/shopping_cart'

RSpec.describe ShoppingCart do

    before(:each) do
        @cart = ShoppingCart.new("King Soopers", "30items")
        @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        @product2 = Product.new(:meat, 'chicken', 4.50, '2')  
        @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    end

    it 'exists' do
        expect(@cart).to be_an_instance_of(ShoppingCart)
    end

    it 'has attributes' do
        expect(@cart.name).to eq("King Soopers")
        expect(@cart.capacity).to eq(30)
        expect(@cart.products).to eq([])
    end

    it 'can have products added' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        expect(@cart.products).to eq([@product1, @product2])
    end

    it 'has details' do
        expected = { name: "King Soopers", capacity: 30}
        expect(@cart.details).to eq(expected)
    end

    it 'can count the total number of products' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)

        expect(@cart.total_number_of_products).to eq(13)
    end

    it 'is full once capacity is reached' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)

        expect(@cart.is_full?).to be false

        product4 = Product.new(:produce, 'apples', 0.99, '20')
        @cart.add_product(product4)

        expect(@cart.is_full?).to be true
    end

    it 'can return an array of products within a category' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)  
        product4 = Product.new(:produce, 'apples', 0.99, '20')
        @cart.add_product(product4)

        expect(@cart.products_by_category(:paper)).to eq([@product1, @product3])
    end

    it 'can give a percentage occupied' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3) 

        expect(@cart.percentage_occupied).to eq(43.33)
    end

    it 'can sort products by quantity' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3) 
        product4 = Product.new(:produce, 'apples', 0.99, '20')
        @cart.add_product(product4)
        expected = [product4, @product1, @product2, @product3]
        expect(@cart.sorted_products_by_quantity).to eq(expected)
    end

    xit 'can break down cart by product category' do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3) 
        product4 = Product.new(:produce, 'apples', 0.99, '20')
        @cart.add_product(product4)
        expected = {
            meat: [@product2],
            paper: [@product1, @product3],
            produce: [product4]
        }
        expect(@cart.product_breakdown).to eq(expected)
    end

end
