require 'rails_helper'
  describe "the add a new answer process" do
    it "adds a new answer", js: true do
      enjoyer = FactoryGirl.create(:enjoyer)
      login(enjoyer)
      question = FactoryGirl.create(:question)
      visit question_path(question)
      click_on "Answer"
      fill_in "Content", :with => "answer sample"
      click_on "Answer"
      expect(page).to have_content "answer"
    end
end
