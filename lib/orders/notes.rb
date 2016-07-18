module QuickOrders
  class Notes
    include CsvHelpers
    def initialize(order,row_type, index)
      @order = order.data
      @row_type = row_type
      @index = index
    end

    def is_first?
      @index == :first
    end



    def details
      {
        notes: safe(notes),
        note_attributes: note_attributes,
        cancelled_at: cancelled_at
      }
    end

    def notes
      # binding.pry
      @order['note'].to_s + @order['line_items'][0]['properties'].map { |p| "#{p['name']} : #{p['value']}" }.join('|')
    end

    def note_attributes
      @order['note_attributes'].join(',')
    end

    def cancelled_at
      shopify_date(@order['cancelled_at'])
    end


  end
end

