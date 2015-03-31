FactoryGirl.define do
  factory(:enjoyer) do
    sequence(:email) { |n| "enjoyer#{n}@happy.com" }
    password 'password'
  end
  factory(:question) do
    title 'example question title'
    content 'example question'
    enjoyer_id 1
    enjoyer
  end
  factory(:answer) do
    content 'example answer'
    enjoyer_id 1
    question
  end
end
