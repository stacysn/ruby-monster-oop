class Pizza
  attr_accessor :crust, :is_delicious

  @@is_food = true

  def initialize
    @crust = "garlic"  # all pizzas start with garlic crust
  end

  def self.is_food
    @@is_food
  end
end

pepperoni = Pizza.new
puts pepperoni.crust
# garlic
pepperoni.crust = "bbq"
puts pepperoni.crust
# bbq
puts Pizza.is_food
# true
