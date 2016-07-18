module QuickOrders
  class Address
    include CsvHelpers
    def initialize(order,type, index)
      @index = index
      @type = type
      @data = order.data[@type]
      @fields = 10
    end

    def is_first?
      @index == :first
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
        "#{@type}_name": safe(name),
        "#{@type}_street": safe(street),
        "#{@type}_address1": safe(address1),
        "#{@type}_address2": safe(address2),
        "#{@type}_company": safe(company),
        "#{@type}_city": safe(city),
        "#{@type}_zip": safe(zip),
        "#{@type}_province": safe(province),
        "#{@type}_country": safe(country),
        "#{@type}_phone": phone
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
      @data['name'] if is_first?
    end

    def street
      "#{address1} #{address2} " if is_first?
    end

    def address1
      @data['address1'] if is_first?
    end

    def address2
      @data['address2'] if is_first?
    end

    def company
      @data['company'] if is_first?
    end

    def city
      @data['city'] if is_first?
    end

    def zip
      @data['zip'] if is_first?
    end

    def province
      @data['province'] if is_first?
    end

    def country
      @data['country'] if is_first?
    end

    def phone
      @data['phone'] if is_first?
    end

  end
end

