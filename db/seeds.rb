# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reward.create(name: "Front row for UNC game", start_time: "2021-02-18 06:00:00", end_time: "2021-02-18 08:00:00", location: "Cameron", description: "Sit front row for Duke vs UNC in Cameron. No need to tent anymore, although you are still welcome to do so. We won't judge", points: "250", category: "Athletics", expiry_time: "2020-05-07", expiry_quantity: "10", image: nil, email: "coachk@duke.edu")
Reward.create(name: "Duke Dining Teddy Bear", start_time: "2021-01-08 13:00:00", end_time: "2021-01-20 18:00:00", location: "Bryan Center", description: "Receive a Duke Dining Teddy Bear when you redeem this reward!", points: "100", category: "Dining", expiry_time: "2020-02-02 14:00:00", expiry_quantity: "20", image: nil, email: "joe@duke.edu")

User.create(name: "Kaila", username: "kk721", profile_pic: "https://upload.wikimedia.org/wikipedia/commons/a/af/Duke_Chapel_4_16_05.jpg", accumulated_total_points: 100, athletics_points: "40", dining_points: "60", netid: "kml82", email: "kml82@duke.edu", accumulated_athletics_points: 40, accumulated_dining_points: 60, primary_affiliation: "Student")
User.create(name: "Felix", username: "Bob The Builder", profile_pic: "https://lh3.googleusercontent.com/proxy/ctnBcXm5cjAGEyC7yoGIS9DGtuFzErdQ3gXvDyKVPYd6dZUCNltMxzU_Gdvdq8KSsvC7Jz3KDSjWADvCI04x4PF1g0npdjg", accumulated_total_points: 1850, athletics_points: 1000, dining_points: 500, netid: "fj32", email: "fj32@duke.edu", accumulated_athletics_points: 1100, accumulated_dining_points: 750, primary_affiliation: "Student")

# User.create(name: Idmws.getNameFromNetID("rpm32")[0]["display_name"], netid: Idmws.getNameFromNetID("rpm32")[0]["netid"], email: Idmws.getNameFromNetID("rpm32")[0]["emails"][0])

Announcement.create(title: "Announcement 1", description: "This is the description of the announcement", category: "Dining")

# Seeded events do not show up anywhere now. All event data is pulled from calendar api


#Event.create(name: "Duke VS. VT Men's Basketball Game", start_time: "2021-11-18 16:00:00", end_time: "2021-11-18 18:00:00", location: "Cameron Stadium", description: "Come support our men's basketball team against VT tonight at 8:00PM! Doors open at 7:00PM.", points: "350", category: "Athletics", image: nil)
#Event.create(name: "Special deal at Sazon!", start_time: "2021-11-28 06:00:00", end_time: "2021-11-28 08:00:00", location: "West Union", description: "Sazon is offering their weekly special, the steak bowl, today during lunch!", points: "150", category: "Dining", image: nil)
#Event.create(name: "Morning Yoga Class", start_time: "2021-12-03 06:00:00", end_time: "2021-12-03 06:00:00", location: "Brodie Gym", description: "Early birds, come join us for a morning yoga class; instructor: Melissa Jones.", points: "250", category: "Athletics", image: nil)
#Event.create(name: "Marketplace Thanksgiving Dinner", start_time: "2021-11-20 16:00:00", end_time: "2021-11-20 21:00:00", location: "Marketplace", description: "Let's all celebrate Thanksgiving together with a special dinner at Marketplace!", points: "200", category: "Dining", image: nil)
#Event.create(name: "Duke VS. UNC Women's Volleyball Game", start_time: "2021-11-30 18:00:00", end_time: "2021-11-30 19:00:00", location: "Wilson Recreation Center", description: "Come support our women's volleyball team against UNC today at 5:00PM!", points: "400", category: "Athletics", image: nil)
