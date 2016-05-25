module QuickOrders
  class Details
    def initialize(order)
      @order = order.data
    end

    def details
      { 
        financial_status: financial_status,
        paid_at: paid_at,
        fulfillment_status: @order['fulfillment_status'],
        fulfilled_at: @order['closed_at'],
        accepts_marketing: @order['buyer_accepts_marketing'],
        currency: @order['currency'],
        subtotal: @order['subtotal_price'],
        shipping: @order['shipping_lines'].map { |sl| sl['price'].to_f }.sum,
        taxes: @order['total_tax'],
        total: @order['total_price'],
        discount_code: @order['discount_codes'].map { |c| c['code'] }.join('|'),
        discount_amount: @order['total_discounts'],
        shipping_method: @order['shipping_lines'].map { |sl| sl['title'] }.join('|'),
        created_at: @order['created_at']
      }
    end

    def financial_status
      @order['financial_status']
    end

    def paid_at
      if financial_status == 'paid'
        @order['processed_at']
      else
        nil
      end
    end

  end
end

