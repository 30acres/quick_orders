module QuickOrders
  class LineItem
    include CsvHelpers
    def initialize(order,index,lin)
      @order = order.data
      @line_item = order.data['line_items'][lin]
    end

    def details
      {
        line_item_quantity: line_item_quantity,
        line_item_name: line_item_name,
        line_item_price: line_item_price,
        line_item_compare_at_price: line_item_compare_at_price,
        line_item_sku: line_item_sku,
        line_item_requires_shipping: line_item_requires_shipping,
        line_item_taxable: line_item_taxable,
        line_item_fulfillment_status: line_item_fulfillment_status
      }
    end

    def line_item_quantity
      @line_item['quantity']
    end

    def line_item_name
      safe(@line_item['name'])
    end

    def line_item_price
      to_dollar(@line_item['price'])
    end

    def line_item_compare_at_price
      to_dollar(@line_item['compare_at_price'])
    end

    def line_item_sku
      @line_item['sku']
    end

    def line_item_requires_shipping
      @line_item['requires_shipping']
    end

    def line_item_taxable
      @line_item['taxable']
    end

    def line_item_fulfillment_status
      !@line_item['fulfillment_status'].blank? ? @line_item['fulfillment_status'] : 'pending'
    end

  end
end

