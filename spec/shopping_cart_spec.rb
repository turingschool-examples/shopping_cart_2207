require "./lib/product"
require "./lib/shopping_cart"


describe(Product) do
  context("Iteration 2") do
    before(:each) do
      @cart = ShoppingCart.new("King Soopers", "30items")
      @product1 = Product.new(:paper, "toilet paper", 3.70, "10")
      @product2 = Product.new(:meat, "chicken", 4.50, "2")
      @product3 = Product.new(:paper, "tissue paper", 1.25, "1")
    end

    it("exisits") do
      expect(@cart).to(be_a(ShoppingCart))
    end

    it("has a name") do
      expect(@cart.name).to(eq("King Soopers"))
    end

    it("has a capacity") do
      expect(@cart.capacity).to(eq(30))
    end

    it("has products") do
      expect(@cart.products).to(eq([]))
    end

    it("can add products") do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      expect(@cart.products).to(eq([@product1, @product2]))
    end

    it("has details") do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      expect(@cart.details).to(eq({name: "King Soopers", capacity: 30}))
    end

    it("can give a total count of products") do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      expect(@cart.total_number_of_products).to(eq(13))
    end
  end
end
