
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
      this_amount = 0

      ## determine amont for each lines
      case rental.movie.price_code
      when Movie::REGULAR
        this_amount += 2
        this_amount += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
      when Movie::NEW_RELEASE
        this_amount += rental.days_rented * 3
      when Movie::CHILDRENS
        this_amount += 1.5
        this_amount += (element.days_rented -3 ) * 1.5 if rental.days_rented > 3
      end
      ## add frequent renter points
      frequent_renter_points += 1
      if rental.movie.price_code == MOVIE.NEW_RELEASE && rental.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + rental.movie.title + "\t" + this_amount.to_s + "\n"
      this_amount += this_amount

    end
    # add footer
    result += "Amount owned is #{total_amount}"
    result += "You earned #{frequent_renter_points} frequent_renter_points"
    result

  end

  def amount_for
    
  end

  # def amount_for(rental)
  #
  # end

end

class Program

end
