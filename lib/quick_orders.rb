require "quick_orders/version"
require "csv"

module QuickOrders
  require "csv/csv_helpers"  
  require "csv/shopify_csv"  
  require "csv/order_row"  

  def self.all_orders_from_source
    ShopifyAPI::Order.find(:all, params: { limit: 250 })
  end

  def self.dump_orders(client)
    RawDatum.hold_all
    all_orders_from_source.each do |order|
      RawDatum.create(data: order.to_json, client_id: client, status: 3, shop_id: client)
    end
    RawDatum.cleanup
  end

  def self.return_csv(shop)
    ShopifyCsv.all_stored_orders(shop)
  end

end

