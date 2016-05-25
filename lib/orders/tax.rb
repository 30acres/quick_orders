module QuickOrders
  class Tax
    def initialize(order)
      @order
    end

    def details
     # 'Tax 1 Name',
     # 'Tax 1 Value',
     # 'Tax 2 Name',
     # 'Tax 2 Value',
     # 'Tax 3 Name',
     # 'Tax 3 Value',
     # 'Tax 4 Name',
     # 'Tax 4 Value',
     # 'Tax 5 Name',
     # 'Tax 5 Value'

      { 
        tax_1_name: 'tax 1 name',
        tax_1_value: 'tax 1 value',
        tax_2_name: 'tax 2 name',
        tax_2_value: 'tax 2 value',
        tax_3_name: 'tax 3 name',
        tax_3_value: 'tax 3 value',
        tax_4_name: 'tax 4 name',
        tax_4_value: 'tax 4 value',
        tax_5_name: 'tax 5 name',
        tax_5_value: 'tax 5 value'
      }
    end


  end
end

