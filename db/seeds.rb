# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "admin@co.jp", password: "naganocake", password_confirmation: "naganocake")

# ここから仮のデータ。実装前に削除
Member.create(email:"public@co.jp",password:"naganocake",encrypted_password:"naganocake", last_name:"山田", first_name:"花子", last_name_ruby:"ヤマダ", first_name_ruby:"ハナコ", postal_code:"0000000", address:"宮崎県", telephone_number:"00000000000", is_deleted:true)
Genre.create(name:"ケーキ")
Item.create(name:"チーズケーキ",description:"北海道産チーズ使用",genre_id: 1,price_excluding_tax: 1200,is_for_sale:true)

Order.create(member_id:1,postal_code:"1111111",address:"宮城県",name:"山田花子",payment_method:0,status:0,total_payment_amount:2000)
OrderItem.create(order_id: 1,item_id: 1,quantity: 1,price: 1320,production_status: 0)


