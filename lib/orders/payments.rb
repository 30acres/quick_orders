module QuickOrders
  class Payments
    def initialize(order,index,lin)
      @index = index
      @order = order.data
      @line_item = order.data['line_items'][lin]
    end

    def is_first?
      @index == :first
    end



    def details
      { 
        payment_method: payment_method,
        payment_reference: payment_reference,
        refunded_amount: refunded_amount,
        vendor: vendor,
        # outstanding_balance: outstanding_balance,
        # employee: employee,
        # location: location,
        # device_id: device_id,
        id: id,
        tags: tags,
        risk_level: risk_level,
        source: source,
        lineitem_discount: lineitem_discount
      }
    end

    def payment_method
      @order['payment_gateway_names'].join(',')
    end

    def payment_reference
      "c#{@order['checkout_id']}.#{payment_type}"
    end

    def payment_type
      case 
      when payment_method.include?('shopify_payments')
        "1"
      else
        "1" ## NO IDEA
      end
    end

    def refunded_amount
      !@order['refund'].blank? ? to_dollar(@order['refund'].to_i) : 0
    end

    def vendor
      @line_item['vendor']
    end

    def location
      @order['location_id'] ##n/a
    end

    def device_id
      @order['device_id'] ##n/a
    end

    def id
      @order['id']
    end

    def tags
      @order['tags']
    end

    def risk_level
      'n/a'
    end

    def source
      @order['source_name']
    end

    def lineitem_discount
      @line_item['discount']
    end


  end
end

