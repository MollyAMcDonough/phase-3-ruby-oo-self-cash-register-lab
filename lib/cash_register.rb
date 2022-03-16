class CashRegister
    attr_accessor :total, :items
    attr_reader :discount

    def initialize (discount=0)
        @discount = discount
        @total = 0
        @items = []
        @last_transactions = []
    end
    def add_item(title,price,quantity=1)
        @total += price * quantity
        @last_transactions.push([title, price, quantity])
        quantity.times { @items.push(title) }
    end
    def apply_discount
        if @discount != 0
            @total = @total * (100-@discount) / 100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        if @last_transactions.length == 0
            "Nothing in cart"
        else
            last = @last_transactions.pop
            last[2].times do 
                @total -= last[1]
                @items.pop
            end
        end
    end
end
