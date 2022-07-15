require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'exists' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart).to be_an_instance_of ShoppingCart
    end
  
    it 'has attributes' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart.name).to eq("King Soopers") 
      expect(cart.capacity).to eq(30)
      expect(cart.products).to eq([])
    end

    it 'can put products in cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
  
      cart.add_product(product1)
      cart.add_product(product2)
  
      expect(cart.products).to eq([product1, product2])
    end

    it 'can give its details' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart.details).to eq({ name: "King Soopers", capacity: 30 })
    end
  end
end