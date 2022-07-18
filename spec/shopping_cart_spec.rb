require './lib/product'
require 'rspec'
require './lib/shopping_cart'

describe 'cart' do
  it 'exists' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  it 'adds products to cart' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    expect(cart.add_products).to eq(product1)
    expect(cart.add_products).to eq(product2)
  end
end
