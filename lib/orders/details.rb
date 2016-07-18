module QuickOrders
  class Details
    include CsvHelpers
    def initialize(order, index)
      @index = index
      @order = order.data
    end

    def is_first?
      @index == :first
    end


    def created_at
      { created_at: created_at_time }
    end

    def details
      { 
        financial_status: financial_status,
        paid_at: paid_at,
        fulfillment_status: fulfillment_status,
        fulfilled_at: fulfilled_at,
        accepts_marketing: accepts_marketing,
        currency: currency,
        subtotal: subtotal,
        shipping: shipping,
        taxes: taxes,
        total: total,
        discount_code: discount_code,
        discount_amount: discount_amount,
        shipping_method: shipping_method
      }
    end

    def created_at_time
       shopify_date(@order['created_at'])
    end

    def fulfillment_status
      !@order['fulfillment_status'].blank? ? @order['fulfillment_status'] : 'unfulfilled'  if is_first?
    end

    def is_fulfilled?
      @order['fulfillment_status'] == 'fulfilled'
    end

    def fulfilled_at
      shopify_date(@order['processed_at']) if is_fulfilled? and is_first?
    end

    def accepts_marketing
      (@order['buyer_accepts_marketing'] == true ? 'yes' : 'no' ) if is_first?
    end

    def currency
      @order['currency'] if is_first?
    end

    def subtotal
      to_dollar(@order['subtotal_price']) if is_first?
    end

    def shipping
      to_dollar(@order['shipping_lines'].map { |sl| sl['price'].to_f }.sum)  if is_first?
    end

    def taxes
      @order['total_tax'] if is_first?
    end

    def total
      @order['total_price'] if is_first?
    end

    def discount_code
      @order['discount_codes'].map { |c| c['code'] }.join('|')  if is_first?
    end

    def discount_amount
      to_dollar(@order['total_discounts']) if is_first?
    end

    def shipping_method
      @order['shipping_lines'].map { |sl| sl['title'] }.join('|') if is_first?
    end

    def financial_status
      @order['financial_status'] if is_first?
    end

    def paid_at
      if financial_status == 'paid'
        shopify_date(@order['processed_at']) if is_first?
      else
        nil
      end
    end

  end
end

