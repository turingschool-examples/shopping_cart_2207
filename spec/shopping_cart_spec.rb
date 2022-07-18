require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  let(:cart) { ShoppingCart.new("King Soopers", "30items") }
  let(:product1) { Product.new(:paper, 'toilet paper', 3.70, '10') }
  let(:product2) { Product.new(:meat, 'chicken', 4.50, '2') }
  
  it 'should be a class' do
    expect(cart).to be_an_instance_of ShoppingCart
  end

  it 'should reflect capacity' do
    expect(cart.capacity).to eq 30
  end

  it 'should return the product array' do
    expect(cart.products).to eq ([])
  end

  xit 'should be able to add products to cart' do
    cart.add_product(product1)
    cart.add_product(product2) 
# require 'pry';binding.pry
    expect(cart.products).to eq(product1)
        #output is not within array brackets
  end

  it 'should inform what items are in the cart' do
    cart
    expect(cart.details).to eq(cart)
    
  end





end