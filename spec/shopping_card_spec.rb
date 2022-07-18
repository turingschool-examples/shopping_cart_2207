require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  it 'does exist' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart).to be_instance_of(ShoppingCart)
  end

  it 'has a name' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart.name).to eq("King Soopers")
  end

  it 'has a capacity' do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart.capacity).to eq("30items")
  end

  it 'can add products' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)
    expect(cart.products).to eq([product1, product2])

  end

  it 'can return cart details' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)
    expect(cart.details).to eq({"name" => "King Soopers", "capacity" => "30items"})
  end

  it 'can add number of products in a cart' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    expect(cart.total_number_of_products).to eq(13)
  end

  it 'can be full' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    expect(cart.is_full?).to be(false)
    cart.add_product(product4)
    expect(cart.is_full?).to be(true)
  end

  it 'can return products in a cart by category' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)
    expect(cart.products_by_category(:paper)).to eq([product1, product3])
  end

  it 'can return the percent of the cart occupied' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    expect(cart.percentage_occupied).to eq(43.33)
  end

  it 'can sort products by quantity' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)
    expect(cart.sorted_products_by_quantity).to eq([product4, product1, product2, product3])
  end

  it 'can breakdown products in a cart' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)
    expected_hash = {:meat => [product2],
                    :paper => [product1, product3],
                    :produce => [product4]

    }
    expect(cart.product_breakdown).to eq(expected_hash)
  end

end
