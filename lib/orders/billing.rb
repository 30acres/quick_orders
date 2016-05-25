module QuickOrders
  class Address
    def initialize(order,type)
      @data = order.data[type]
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
        binding.pry
      {
        name: name,
        street: 'billing street',
        address1: 'billing address1',
        address2: 'billing address2',
        company: 'billing company',
        city: 'billing city',
        zip: 'billing zip',
        province: 'billing province',
        country: 'billing country',
        phone: 'billing phone'
      }
    end

    def empty_hash
      empty_hash = Hash.new
      @fields.times do |h|
        empty_hash[h] = '' 
      end
      empty_hash
    end

    def name
      @data['name']
    end


  end
end

