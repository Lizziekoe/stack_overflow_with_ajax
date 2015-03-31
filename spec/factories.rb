FactoryGirl.define do
  factory(:enjoyer) do
    email 'enjoyer@happy.com'
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
