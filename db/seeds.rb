@user = User.create(email: "test@test.com", password: "asdfgh", password_confirmation: "asdfgh",first_name: "john",last_name: "Snow")


puts "1 user created"
100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content",user_id: @user.id)
end

puts "100 posts has benn created"