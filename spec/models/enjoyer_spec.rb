require 'rails_helper'
  describe Enjoyer do
    it { should have_many :questions}
    it { should have_many :answers}
end
