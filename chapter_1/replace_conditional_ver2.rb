
class Movie

  # this stays
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  # attr_reader :title
  # attr_accessor :price_code
  attr_writer :price
  attr_reader :price_code

  def price_code=(value)
    @price_code = value
  end

  def price_code=(value)
    @price_code = value
    @price = case price_code
      when REGULAR: RegularPrice.new
      when NEW_RELEASE: NewReleasePrice.new
      when CHILDRENS: ChildrensPrice.new
    end
  end

  def initialize(title, price_code)
    @title, self.price_code = title, price_code
  end

  def charge(days_rented)
    result = 0
    case price_code
    when REGULAR
      return @price.charge(days_rented)
    when NEW_RELEASE
      result += days_rented * 3
    ## every single one of this method can be its own class
    when CHILDRENS
      result += 1.5
      result += (days_rented - 3 ) * 1.5 if days_rented > 3
    end
  end

  ## charge in the end will become like this
  def charge(days_rented)
    @price.charge(days_rented)
  end

  ## we want to remove the case statement here
  def charge(days_rented)
    result = 0
    case price_code
    ## every single one of this method can be its own class
    when REGULAR
      result += 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
    ## every single one of this method can be its own class
    when NEW_RELEASE
      result += days_rented * 3
    ## every single one of this method can be its own class
    when CHILDRENS
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

#

class RegularPrice
  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end

class NewReleasePrice

end

class ChildrensPrice

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
    movie_2 = Movie.new("Sex and the City",Movie::REGULAR)

    rental = Rental.new(movie, 5)a

  end

end
