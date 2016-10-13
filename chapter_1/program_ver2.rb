require 'byebug'

class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

end

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def charge
    result = 0
    case self.movie.price_code
    when Movie::REGULAR
      result += 2
      result += (self.days_rented - 2) * 1.5 if self.days_rented > 2
    when Movie::NEW_RELEASE
      result += self.days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (self.days_rented -3 ) * 1.5 if self.days_rented > 3
    end
    return result
  end

end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    ## object of rentals
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Records for #{name}\n"
    # for each rental that the customer has, check the rental's price code
    @rentals.each do |rental|
      this_amount = amount_for(rental)
      ## add frequent renter points
      frequent_renter_points = get_frequent_rental_points(rental)

      result += "\t" + rental.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end
    # add footer
    result += "Amount owned is #{total_amount}"
    result += "You earned #{frequent_renter_points} frequent_renter_points"
    result

  end

  def amount_for(rental)
    rental.charge
  end

  def get_frequent_rental_points(rental)
    frequent_renter_points = 0
    frequent_renter_points += 1
    if rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 1
      frequent_renter_points += 1
    end
    frequent_renter_points
  end

end




class RefactoredProgram

  attr_accessor :customer

  def initialize
    prerequisites()
  end

  def print_customer_statement
    @customer.statement
  end

  private

  def prerequisites
    regular_movie = Movie.new("Superman", Movie::REGULAR)
    new_release_movie = Movie.new("Superman New Release", Movie::NEW_RELEASE)

    regular_rental = Rental.new(regular_movie, 5)
    new_release_rental = Rental.new(new_release_movie, 5)


    @customer = Customer.new("YC")
    @customer.add_rental(regular_rental)
    @customer.add_rental(new_release_rental)
    # @customer.add_rental(regular_rental)
  end

end
