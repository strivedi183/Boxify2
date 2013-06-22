# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clean the database
Users.destroy_all
Boxes.destroy_all
Subscription.destroy_all
Shipment.destroy_all

# Users
# a1 = User.create(first_name: "Jamal", last_name: "OGarro", role: "Admin", interests: ["sneakers", "music"], email: "jamal@example.com", password: "11111111", password_confirmation: "11111111")

m1 = User.create(name: "Kith NYC", first_name: "John", last_name: "Smith", role: "Merchant", email: "merchant1@example.com", password: "11111111", password_confirmation: "11111111")
m2 = User.create(name: "Music Hut", first_name: "John", last_name: "Smith", role: "Merchant", email: "merchant2@example.com", password: "11111111", password_confirmation: "11111111")
m3 = User.create(name: "Boards R Us", first_name: "John", last_name: "Smith", role: "Merchant", email: "merchant3@example.com", password: "11111111", password_confirmation: "11111111")

c1 = User.create(first_name: "Luke", last_name: "Skywalker", role: "Customer", interests: ["books", "sneakers", "cars", "comics"] email: "customer@example.com", password: "11111111", password_confirmation: "11111111")


# Boxes
b1 = Box.create(name: "Surfer Box", description: "The perfect box for surfer dudes", frequency: "monthly", price: 35.00, items: ["sneakers", "socks", "t-shirts"], user_id: m1.id)
b2 = Box.create(name: "Music Lover's Box", description: "The perfect box for music lovers", frequency: "monthly", price: 25.00, items: ["music", "CDs", "posters"], user_id: m2.id)
b3 = Box.create(name: "The Style Box", description: "A box for the stylish man", frequency: "quarterly", price: 125.00, items: ["jeans", "jackets", "dress shirts"], user_id: m3.id)


# Subscriptions
s1 = Subscription.create(box_id: b1.id, user_id: c1.id, is_active: true, price: b1.price, start_date: Date.current - 4)
s2 = Subscription.create(box_id: b2.id, user_id: c1.id, is_active: true, price: b2.price, start_date: Date.current - 10)
s3 = Subscription.create(box_id: b3.id, user_id: c1.id, is_active: false, price: b3.price, stat_date: Date.current - 60, end_date: Date.current - 7 )


# Shipments
ship1 = Shipment.create(desc: "June Shipment - 2013", ship_date: Date.current - 10, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship2 = Shipment.create(desc: "May Shipment - 2013", ship_date: Date.current - 30, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship3 = Shipment.create(desc: "April Shipment - 2013", ship_date: Date.current - 60, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship4 = Shipment.create(desc: "March Shipment - 2013", ship_date: Date.current - 90, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship5 = Shipment.create(desc: "February Shipment - 2013", ship_date: Date.current - 120, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship6 = Shipment.create(desc: "January Shipment - 2013", ship_date: Date.current - 150, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship7 = Shipment.create(desc: "December Shipment - 2012", ship_date: Date.current - 180, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship8 = Shipment.create(desc: "November Shipment - 2012", ship_date: Date.current - 210, has_shipped: true, subscription_id: s1.id, user_id: c1.id)
ship9 = Shipment.create(desc: "October Shipment - 2012", ship_date: Date.current - 240, has_shipped: true, subscription_id: s1.id, user_id: c1.id)

# Queries