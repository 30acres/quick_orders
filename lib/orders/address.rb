module QuickOrders
  class Address
    def initialize(order,type)
      @type = type
      @data = order.data[@type]
      @fields = 10
    end

    def details
      if @data
        full_hash
      else
        empty_hash
      end
    end

    def full_hash
      {
        "#{@type}_name": name,
        "#{@type}_street": 'street',
        "#{@type}_address1": 'address1',
        "#{@type}_address2": 'address2',
        "#{@type}_company": 'company',
        "#{@type}_city": 'city',
        "#{@type}_zip": 'zip',
        "#{@type}_province": 'province',
        "#{@type}_country": 'country',
        "#{@type}_phone": 'phone'
      }
    end

    def empty_hash
      empty_hash = Hash.new
      @fields.times do |h|
        empty_hash["#{@type}_empty_#{h}"] = ''
      end
      empty_hash
    end

    def name
      @data['name']
    end


  end
end

