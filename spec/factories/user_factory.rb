FactoryGirl.define do
  factory(:user) do
    sequence :username do |n|
      "pokemon#{n}"
    end
    password 'test'
    role 'user'

    factory(:admin) do
      username 'adminuser'
      role 'admin'
    end

    factory :guest do
      username 'guestuser'
      role 'guest'
    end
  end
end
