module QuickOrders
  class Base
    def initialize(order)
      @order = order.data
    end

    def details
      {
        name: name,
        email: email 
      }
    end

    def name
      @order['name'].to_s
    end

    def email
      @order['email'].to_s
    end


  end
end

