require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do

  before :each do
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  it 'can name store currently shopping at' do
    expect(@cart.name).to eq('King Soopers')
  end

  it 'can return cart capacity' do
    expect(@cart.capacity).to eq(30)
  end

  it 'can return products in cart' do
    expect(@cart.products).to eq([])
  end

  it 'can count and return info for products in cart' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    expect(@cart.products.count).to eq(2)
    expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
  end

  it 'can return number of products in cart' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    expect(@cart.total_number_of_products).to eq(13)
  end

  it 'can tell if cart is full' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    expect(@cart.is_full?).to eq(false)
  end

  it 'can confirm cart is full' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    expect(@cart.is_full?).to eq(true)
  end

  it 'can return products by category' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    expect(@cart.products_by_category(:paper).count).to eq(2)
  end

  xit 'can return percent occupied' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    expect(@cart.percentage_occupied).to eq(43.33)
  end

  it 'can return a products by quantityproduct breakdown' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    @cart.sorted_products_by_quantity

    @cart.product_breakdown
  end
end
