class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  validates :username, presence: true

  def self.authenticate(username)
    user = User.where(username: username).first
    if user
      user
    else
      nil
    end
  end
end
