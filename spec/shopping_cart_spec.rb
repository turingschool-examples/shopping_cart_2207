require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do

  let(:cart) {ShoppingCart.new("King Soopers", "30items")}

  it 'exists' do
    expect(cart).to be_a(ShoppingCart)
  end

  it 'has name' do
    expect(cart.name).to eq("King Soopers")
  end

  it 'has capacity' do
    expect(cart.capacity).to eq(30)
  end

  it 'can add products' do
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    expect(cart.products).to eq([product1, product2])
  end

  it 'can show details' do
    expect(cart.details).to eq({name: "King Soopers", capacity: 30})
  end

  it 'can become full' do
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.total_number_of_products).to eq(13)
    expect(cart.is_full?).to be false

    cart.add_product(product4)
    expect(cart.is_full?).to be true
  end

  it 'can categorize products' do
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)
    
    expect(cart.products_by_category(:paper)).to eq([product1, product4])
  end

  it 'can determine how full' do
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.percentage_occupied).to eq(43.33)
  end


end
