User.create!(name:  "Ahmed Mohamed Fouad",
             email: "ahmedfouad2020era@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678"
             )

Status.create!(statu: 'Present')
Status.create!(statu: 'Absent')
Status.create!(statu: 'Sick Leave')
Status.create!(statu: 'Day OFF')
AdminUser.create!(email: 'admin@eseed.net', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?