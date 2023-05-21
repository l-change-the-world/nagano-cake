# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "admin@co.jp", password: "naganocake", password_confirmation: "naganocake")

# ここから仮のデータ。実装前に削除
#Member.create(email:public@co.jp,last_name:"山田",first_name:"花子",last_name_ruby:"ヤマダ",first_name_ruby:"ハナコ",postal_code:address:telephone_number:is_deleted:)
#Genre.create(name:"ケーキ")
#Item.create(name:"チーズケーキ",description:"北海道産チーズ使用",genre_id: 1,price_excluding_tax: 1200,is_for_sale:true)
#OrderItem.create(order_id: 1,item_id: 1,quantity: 1,price: 1,production_status: 0)
#Order.create(postal_code:address:name:shipping_fee:payment_method:status:total_payment_amount)