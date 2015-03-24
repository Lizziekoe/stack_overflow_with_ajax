FactoryGirl.define do
  factory(:user) do
    username 'example user'
  end
  factory(:question) do
    title 'example question title'
    content 'example question'
    user_id 1
    user
  end
  factory(:answer) do
    content 'example answer'
    user_id 1
    question
  end
end
