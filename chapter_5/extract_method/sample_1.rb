require 'byebug'
## Mechanics for Extracting Method

## create a new method , name it after the intention of the method
## copy the extracted code from the source mthod into the new target method
## scan extracted code for reference to any variables used within this extracted
## code, see if you can use Split Temporary Varbiale

class Order
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

end

# Example: No Local Variables
def print_owing
  outstanding = 0.0

  # print banner
  puts "*******"
  puts "** Customer Owes **"
  puts "*******"

  # calculates outstanding
  @orders.each do |order|
    outstanding += order.amount
  end

  # print detail
  puts "name: #{@name}"
  puts "amount: #{oustanding}"

end



## Extracted Sample
def print_owing
  @orders = []
  @orders << Order.new(5)
  @orders << Order.new(10)
  print_banner

  outstanding = calculate_outstanding

  print_detail(outstanding)

end

def print_banner
  puts "*******"
  puts "** Customer Owes **"
  puts "*******"
end


def calculate_outstanding
  @orders.inject(0) { |result,order| result + order.amount }
end

def print_detail(outstanding)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end


print_owing
