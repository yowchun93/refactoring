require 'byebug'
require 'rspec'
# find all reference to the temp, replace them with the right-hand side of of the assignment
# remove decleration and assignment of the temp



class PriceCalculator

  attr_accessor :quantity, :item_price

  def initialize(quantity:, item_price: )
    @quantity = quantity
    @item_price = item_price
  end

  ## before refactor
  # def calculate_price
  #   base_price = @quantity * @item_price
  #
  #   if (base_price > 1000)
  #     discount_factor * 0.95
  #   else
  #     discount_factor * 0.98
  #   end
  #   base_price * discount_factor
  # end

  def price
    base_price * discount_factor
  end

  def base_price
    @quantity * @item_price
  end

  def discount_factor
    (base_price > 1000) ? 0.95 : 0.98
  end

end


RSpec.describe "Price Calculator" do
  it "should calculate price with correct discount factor" do
    calculator = PriceCalculator.new(quantity: 5, item_price: 10)
    expect(calculator.price).to eq(49)
  end

  it "should calculate price with correct discount factor" do
    calculator = PriceCalculator.new(quantity: 10, item_price: 120)
    expect(calculator.price).to eq(1140)
  end

end
