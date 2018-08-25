require 'sinatra'
require 'ethereum'

get '/' do
  client = Ethereum::HttpClient.new('http://localhost:7545')
  contract = Ethereum::Contract.create(name: 'Colormeshop', truffle: { paths: ['./']}, client: client)
  p contract.transact_and_wait.add_product_transaction('test_product_code', 3)
  p contract.call.product_transactions()
  'ColorMeShop x Ethereum!'
end
