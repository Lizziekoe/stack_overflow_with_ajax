require 'rails_helper'

describe "the add a new user process" do
  it "adds a new user" do
    visit questions_path
    click_on "Sign-Up"
    fill_in "Username", with: "username"
    click_on "Create Account"
    expect(page).to have_content 'Signed'
  end
end
