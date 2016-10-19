
class Item

  attr_accessor :base_price, :tax_rate

  def initialize(base_price, tax_rate)
    @base_price = base_price
    @tax_rate = tax_rate
  end

  def raise_base_price(percent)
    @base_price = @base_price * ( 1 + percent/ 100.0)
  end

  def total
    @base_price * ( 1 + @tax_rate)
  end

end

# Imported Item
class ImportedItem < Item

  attr_reader :import_duty

  def initialize(base_price, tax_rate, import_duty)
    super(base_price, tax_rate)
  end

  def tax_rate
    super + import_duty
  end

end
