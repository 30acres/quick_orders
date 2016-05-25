module QuickOrders
  class LineItem
    def initialize(order)
      @order
    end

    def details
      {
        # 'Lineitem quantity',
        # 'Lineitem name',
        # 'Lineitem price',
        # 'Lineitem compare at price',
        # 'Lineitem sku',
        # 'Lineitem requires shipping',
        # 'Lineitem taxable',
        # 'Lineitem fulfillment status',
        line_item: 'line_items'
      }
    end


  end
end

