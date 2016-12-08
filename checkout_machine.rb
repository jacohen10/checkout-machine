class CheckoutMachine
  def initialize
    @balance = 0
    @bonus_card_scanned = false
    @item_counter = {}
  end

  def scan(sku)
    if sku == 000
      @bonus_card_scanned = true
    else
      update_balance(sku)
    end
  end

  def total
    apply_discount
    @balance
  end

  private

  def apply_discount
    if @bonus_card_scanned
      @item_counter.each do |sku, value|
        @balance -= Item.new(sku, value).discount
      end
    end
  end

  def update_balance
    item = Item.new(sku)
    @balance += item.price
    @counter["#{sku}"] += 1 if item.discounted?
  end
end
