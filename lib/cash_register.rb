class CashRegister

  attr_accessor :total, :discount,:add_item, :items, :price, :quantity

  def initialize(value = 0.0)
   @total = 0.0
   @discount = value
   @items = []
   @price = []
   @quantity = []
  end

  def add_item(item, price, quantity = 1)
    @quantity << quantity
    item_add = quantity
    while item_add > 0
      @items << item
      @price << price
      item_add -= 1
    end
          @total += price * quantity
  end
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = @total * (( 100.0-@discount) / 100.0)
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  def void_last_transaction
    voided = @quantity[-1]
    last_trsnsaction = @price[-1]
    while voided > 0
      @total = @total - last_trsnsaction
      voided -= 1
    end
    @price.slice!(-1)
    @items.slice!(-1)
    @quantity.slice!(-1)
  end
end
