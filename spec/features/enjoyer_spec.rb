require 'rails_helper'

describe "the add a new enjoyer process" do
  it "adds a new enjoyer" do
    visit questions_path
    click_on "Sign-Up"
    fill_in "Email", with: "enjoyer@happy.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    expect(page).to have_content 'successfully'
  end
end

describe "the sign in an enjoyer process" do
  it "signs an enjoyer in" do
    enjoyer = FactoryGirl.create(:enjoyer)
    login(enjoyer)
    expect(page).to have_content "successfully"
  end
end
