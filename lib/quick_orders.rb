require "quick_orders/version"
require "csv"

module QuickOrders
  require "csv/shopify_csv"  
  require "csv/order_row"  

  def self.all_orders_from_source
    ShopifyAPI::Order.all
  end

  def self.dump_orders(client)
    cp = ClientProfile.find(client)
    cp.raw_datum.destroy_all
    all_orders_from_source.each do |order|
      cp.raw_datum.create(data: order.to_json, client_id: client)
    end
  end

  def self.return_csv
    ShopifyCsv.all_stored_orders
  end

end
