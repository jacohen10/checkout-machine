class Item
  attr_reader :sku, :count
  def initialize(sku, count = 0)
    @sku = sku
  end

  def price
    case sku
    when 123
      200
    when 456
      100
    when 789
      1000
    when 111
      550
    end
  end

  def discounted?
    case sku
    when 123
      true
    when 456
      true
    else
      false
    end
  end

  def discount
    case sku
    when 456
      50 * count
    when 123
      200 * (count/3).floor
    end
  end
end
