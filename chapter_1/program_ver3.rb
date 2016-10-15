require 'byebug'

class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  # attr_accessor :price_code
  attr_reader :price_code

  ## create an instance of price , price code will now return an instance of price
  def price_code=(value)
    @price_code = value
    @price = case @price_code
      when REGULAR
        RegularPrice.new
      when NEW_RELEASE
        NewReleasePrice.new
      when CHILDRENS
        ChildrensPrice.new
    end
  end

  def initialize(title, price_code)
    @title, self.price_code = title, price_code
  end

  # require rental's days_rented
  def charge(days_rented)
    return @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    return @price.frequent_renter_points(days_rented)
  end

end

module DefaultPrice
  def frequent_renter_points(days_rented)
    1
  end
end

class RegularPrice
  include DefaultPrice
  def charge(days_rented)
    result = 0
    result += 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    return result
  end
end

class NewReleasePrice

  def charge(days_rented)
    result = 0
    result += days_rented * 3
  end

  def frequent_renter_points(days_rented)
    frequent_rental_points = 1
    if  days_rented > 1
      frequent_rental_points += 1
    end
    return frequent_rental_points
  end

end

class ChildrensPrice
  include DefaultPrice
  def charge(days_rented)
    result = 0
    result += 1.5
    result += (days_rented -3 ) * 1.5 if days_rented > 3
  end
end


class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def charge
    # movie requires rental's day rented
    @movie.charge(days_rented)
  end

  def frequent_renter_points
    @movie.frequent_renter_points(days_rented)
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
    result = "Rental Records for #{name}\n"
    # for each rental that the customer has, check the rental's price code
    @rentals.each do |rental|
      ## add frequent renter points
      result += "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
    end
    # add footer
    result += "Amount owned is #{total_charge}"
    result += "You earned #{total_frequent_renter_points} frequent_renter_points"
    result
  end

  def total_charge
    @rentals.inject(0) { |sum,rental| sum += rental.charge }
  end

  def total_frequent_renter_points
    result = 0
    @rentals.each do |rental|
      result += rental.frequent_renter_points
    end
    result
  end

  ## replace this with just rental.charge
  # def amount_for(rental)
  #   rental.charge
  # end
end



class RefactoredProgramV3

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
