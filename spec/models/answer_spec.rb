require 'rails_helper'

describe Answer do
  it { should belong_to :question }
  it { should belong_to :enjoyer }
  it { should validate_presence_of :content }

  it "sends an email when a question is answered" do
    answer = FactoryGirl.create(:answer)
    AnswerMailer.deliveries.last.to.should eq answer.question.user.username
  end
end
