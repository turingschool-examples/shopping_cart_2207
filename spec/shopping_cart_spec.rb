require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  let(:cart) { described_class.new("King Soopers", "30items") }
  let(:product1) { Product.new(:paper, 'toilet paper', 3.70, '10') }
  let(:product2) { Product.new(:meat, 'chicken', 4.50, '2') }
  let(:product3) { Product.new(:paper, 'tissue paper', 1.25, '1')}
  let(:product4) { Product.new(:produce, 'apples', 0.99, '20') }

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

  it 'has a total number of products' do
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.total_number_of_products).to eq(13)
    expect(cart.is_full?).to eq(false)
  end

  it 'can be full' do
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

  expect(cart.is_full?).to eq(true)
  end

  it 'can display products by category' do
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.products_by_category(:paper)).to eq([product1, product3])
  end

  it 'can display percent occupied' do
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.percentage_occupied).to eq(43.33)
  end

  it 'can sort products by quantity' do
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.sorted_products_by_quantity).to eq([product4, product1, product2, product3])
  end

  it 'can provide a product breakdown' do
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.product_breakdown).to eq({meat: [product2], paper: [product1, product3], produce: [product4]})
  end
end