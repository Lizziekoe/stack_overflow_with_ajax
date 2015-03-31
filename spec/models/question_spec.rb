require 'rails_helper'

describe Question do
  it { should have_many :answers }
  it { should belong_to :enjoyer }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
end
