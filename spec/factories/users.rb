FactoryGirl.define do
  sequence :email do |n|
  	"test#{n}@example.com"
  end

  factory :user do
  	first_name "john"
  	last_name "snow"
  	email { generate :email } 
  	password "asdfgh"
  	password_confirmation "asdfgh"
  end


  factory :admin_user, class: "AdminUser" do
  	first_name "Admin"
  	last_name "User"
  	email { generate :email } 
  	password "asdfgh"
  	password_confirmation "asdfgh"
  end  
end