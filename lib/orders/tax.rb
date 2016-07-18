module QuickOrders
  class Tax
    def initialize(order,index)
      @order = order
      @index = index
    end

    def is_first?
      @index == :first
    end


    def details
      { 
        tax_1_name: '',
        tax_1_value: '',
        tax_2_name: '',
        tax_2_value: '',
        tax_3_name: '',
        tax_3_value: '',
        tax_4_name: '',
        tax_4_value: '',
        tax_5_name: '',
        tax_5_value: ''
      }
    end

  end
end

