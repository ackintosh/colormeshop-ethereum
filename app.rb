require 'sinatra'
require 'sinatra/reloader' if development?
require 'ethereum'
require 'color_me_shop'

get '/' do
  sale_api = sale_api(ENV['COLORMESHOP_ACCESS_TOKEN'])
  p sale_api.get_sales

  client = Ethereum::HttpClient.new('http://localhost:7545')
  contract = Ethereum::Contract.create(name: 'Colormeshop', truffle: { paths: ['./']}, client: client)
  count = contract.call.product_transaction_count
  rows = []
  count.times do |i|
    product_transaction = contract.call.product_transactions(i)
    rows << "<div>#{product_transaction[0]}: #{product_transaction[1]}</div>"
  end
  "<html><head><title>ColorMeShop x Ethereum</title></head><body><h1>ColorMeShop x Ethereum!</h1><h2>transactions</h2>#{rows.join}</body></html>"
end

def sale_api(token)
  ColorMeShop.configure do |config|
    config.access_token = token
  end

  ColorMeShop::SaleApi.new
end
