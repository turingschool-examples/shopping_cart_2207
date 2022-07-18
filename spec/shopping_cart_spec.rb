require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do

  before :each do
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

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
    #
    # expect(@cart.is_full?).to eq(false)
    #
    # product4 = Product.new(:produce, 'apples', 0.99, '20')
    #
    # @cart.add_product(@product4)
    #
    # expect(@cart.is_full?).to eq(true)
    #
    # expect(cart.products_by_category(:paper).count).to eq(2)

end
