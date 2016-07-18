module QuickOrders
  class ShopifyCsv
    def initialize(order_row,row_type,index)
      @order_row = order_row
      @index = index
      @row_type = check_row_type(row_type)
    end

    def self.all_stored_orders
      csv_string = CSV.generate do |csv|
        csv << self.csv_rows
          # binding.pry
        RawDatum.order("data->>'created_at' DESC").each do |order|
          order['data']['line_items'].each_with_index do |order_line_item, index|
            csv << ShopifyCsv.new(order,index,index).rows_builder
          end
        end
      end
      csv_string
    end

    def rows_builder
      row = []
      row << OrderRow.new(@order_row, @row_type, @index).row
      row
    end


    def self.csv_rows
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

    def check_row_type(index)
      if index == 0
        :first
      else
        :not_first
      end
    end


  end
end

