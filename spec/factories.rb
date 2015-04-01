FactoryGirl.define do
  factory(:user) do
    username('dude')
    email('dude@dude.com')
    password('password')
  end
end
