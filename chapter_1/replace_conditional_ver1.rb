
class Movie

  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

  def charge(days_rented)
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
    results
  end

  # movie.frequent_renter_points
  def frequent_renter_points
    (price_code == Movie.NEW_RELEASE) ? 2 : 1
  end

end

class Rental
  attr_reader :movie, :days_rented

  # rental is calling movie.price_code
  # doing case statement based on other object's attribute

  def charge
    movie.charge(days_rented)
  end

  # frequent renter points is using movie's price code
  # move frequent_renter_points to movie
  def frequent_renter_points
    movie.frequent_renter_points
  end

end

class Program

  def run
    movie = Movie.new("Pokemon",1)
    movie_2 = Movie.new("Sex and the City",0)

    rental = Rental.new(movie, 5)

  end

end
