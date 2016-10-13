
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

  # rental is calling movie.price_code
  # doing case statement based on other object's attribute

  def charge
    result = 0
    case movie.price_code
    when Movie::REGULAR
      result += 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      result += days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (days_rented - 3 ) * 1.5 if days_rented > 3
    end
  end

  # frequent renter points is using movie's price code
  # move frequent_renter_points to movie
  def frequent_renter_points
    (movie.price_code == Movie.NEW_RELEASE) ? 2 : 1
  end

end

class Customer
  attr_accessor :name
  # delegated to rental
  def amount_for(rental)
    rental.charge
  end

  # def statement
  #   total_amount, frequent_renter_points = 0,0
  #   result = "Rental Record for #{@name}"
  #   @rentals.each do |rental|
  #     ## add frequent renter points
  #     frequent_renter_points += 1
  #     if rental.movie.price_code == MOVIE.NEW_RELEASE && rental.days_rented > 1
  #       frequent_renter_points += 1
  #     end
  #     # show figures for this rental
  #     result += "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
  #     total_amount += rental.charge
  #   end
  # end

  def statement
    total_amount, frequent_renter_points = 0,0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      frequent_renter_points += element.frequent_renter_points
      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
      total_amount += element.charge
    end

    ## add footer line
    # result += "Amount owned is #{total_amount}"
    result += "Amount owned is #{total_charge}"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
  end

  private
  def total_charge
    result = 0
    @rentals.each do |element|
      result += element.charge
    end
    result
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum,rental| sum + rental.frequent_renter_points }
  end


end
