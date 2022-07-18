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


end



