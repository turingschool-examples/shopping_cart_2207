require "./lib/product"
require "./lib/shopping_cart"


describe(Product) do
  context("Iteration 2") do
    before(:each) do
      @cart = ShoppingCart.new("King Soopers", "30items")
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
  end
end
