require 'sinatra'
require 'sinatra/reloader' if development?
require 'ethereum'

get '/' do
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
