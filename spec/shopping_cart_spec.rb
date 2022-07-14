require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  let(:cart) { described_class.new("King Soopers", "30items") }
  let(:product1) { Product.new(:paper, 'toilet paper', 3.70, '10') }
  let(:product2) { Product.new(:meat, 'chicken', 4.50, '2') }
  
  it 'exists' do
    expect(cart).to be_an_instance_of(described_class)
  end

  it 'has a name' do
    expect(cart.name).to eq("King Soopers")
  end

  it 'has a capacity' do
    expect(cart.capacity).to eq(30)
  end

  it 'has no products by default' do
    expect(cart.products).to eq([])
  end

  it 'can add products' do
    cart.add_product(product1)
    cart.add_product(product2)

    expect(cart.products).to eq([product1, product2])
  end

  it 'can display details' do
    expect(cart.details).to eq({name: "King Soopers", capacity: 30})
  end
end