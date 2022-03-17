# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'a@admin',
  password: 'aadmin'
)

Customer.create!(
  last_name: '長野',
  first_name: 'ケーキ',
  last_name_kana: 'ナガノ',
  first_name_kana: 'ケーキ',
  phone_number: '05012341234',
  address: '東京都港区六本木３丁目２−１',
  post_code: '106−6223',
  email: 'test@test.com',
  password: '111111'
)

Customer.all.each do |customer|
  customer.orders.create!(
  name: 'インフラトップ',
  post_code: '222-2222',
  address: '東京都港区六本木３丁目２−１',
  postage: '800',
  total_price: '5800',
  payment_method: '1',
  status: '1'
  )
end


Order.create!(
  customer_id: '0',
  name: 'インフラトップ',
  post_code: '222-2222',
  address: '東京都港区六本木３丁目２−１',
  postage: '800',
  total_price: '5800',
  payment_method: '1',
  status: '1'
)

Item.create!(
  name: 'ショートケーキ',
  introduction: 'いちごの乗ったショートケーキです。',
  price: '4500',
  is_active: '0'
)

Order_Item.create!(
  order_id: '0',
  item_id: '0',
  tax_price: '5000',
  quantity: '1',
  making_status: '0'
)

