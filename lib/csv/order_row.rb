require 'orders/base'
require 'orders/details'
require 'orders/line_item'
require 'orders/address'
require 'orders/notes'
require 'orders/payments'
require 'orders/tax'
module QuickOrders
  class OrderRow
    def initialize(order,row_type, index)
      @order = order
      @row_type = row_type
      @index = index
    end

    def row
      row = {}
      row = row.merge(Base.new(@order).details)
      row = row.merge(Details.new(@order, @row_type).details)
      row = row.merge(Details.new(@order, @row_type).created_at)
      row = row.merge(LineItem.new(@order, @row_type, @index).details)
      row = row.merge(Address.new(@order,'billing_address', @row_type).details)
      row = row.merge(Address.new(@order,'shipping_address', @row_type).details)
      row = row.merge(Notes.new(@order, @row_type, @index).details)
      row = row.merge(Payments.new(@order,@row_type,@index).details)
      row = row.merge(Tax.new(@order,@row_type).details)
      row.map { |k,v| v }.join(',')
    end

    def csv_rows
      [
        'Name',
        'Email',
        'Financial Status',
        'Paid at',
        'Fulfillment Status',
        'Fulfilled at',
        'Accepts Marketing',
        'Currency',
        'Subtotal',
        'Shipping',
        'Taxes','Total',
        'Discount Code',
        'Discount Amount',
        'Shipping Method',
        'Created at',
        'Lineitem quantity',
        'Lineitem name',
        'Lineitem price',
        'Lineitem compare at price',
        'Lineitem sku',
        'Lineitem requires shipping',
        'Lineitem taxable',
        'Lineitem fulfillment status',
        'Billing Name',
        'Billing Street',
        'Billing Address1',
        'Billing Address2',
        'Billing Company',
        'Billing City',
        'Billing Zip',
        'Billing Province',
        'Billing Country',
        'Billing Phone',
        'Shipping Name',
        'Shipping Street',
        'Shipping Address1',
        'Shipping Address2',
        'Shipping Company',
        'Shipping City',
        'Shipping Zip',
        'Shipping Province',
        'Shipping Country',
        'Shipping Phone',
        'Notes',
        'Note Attributes',
        'Cancelled at',
        'Payment Method',
        'Payment Reference',
        'Refunded Amount',
        'Vendor',
        # 'Outstanding Balance',
        # 'Employee',
        # 'Location',
        # 'Device ID',
        'Id',
        'Tags',
        'Risk Level',
        'Source',
        'Lineitem discount',
        'Tax 1 Name',
        'Tax 1 Value',
        'Tax 2 Name',
        'Tax 2 Value',
        'Tax 3 Name',
        'Tax 3 Value',
        'Tax 4 Name',
        'Tax 4 Value',
        'Tax 5 Name',
        'Tax 5 Value'
      ]
    end

    def name
      if customer
        [customer['first_name'],customer['last_name']].join(' ')
      end
    end

      def customer
        @order.data['customer']
      end

  end
end

