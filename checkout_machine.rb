class CheckoutMachine
  def initialize
    @balance = 0
    @bonus_card_scanned = false
    @salsa_counter = 0
    @chip_counter = 0
  end

  def scan(sku)
    update_balance(sku)

    @dan_the_man = false if sku == 010
  end

  def total
    apply_discount
    @balance
  end

  private

  def apply_discount
    if @bonus_card_scanned
      @balance -= 50 * @salsa_counter
      @balance -= 200 * (@chip_counter/3).floor
    end
  end

  def update_balance(sku)
    if sku == 123
      @chip_counter += 1
      @balance += 200
    elsif sku == 456
      @salsa_counter += 1
      @balance += 100
    elsif sku == 789
      @balance += 1000
    elsif sku == 111
      @balance += 550
    end
  end
end
