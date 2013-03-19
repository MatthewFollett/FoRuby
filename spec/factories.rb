FactoryGirl.define do 
  factory :user do 
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end 
	
  factory :message_post do 
    content "Lorem ipsum"
    author :user
  end 
	
	factory :message_thread do 
    title "Lorem ipsum"
    author :user
  end 
end