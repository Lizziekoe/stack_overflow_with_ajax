class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :enjoyer
  validates :title, presence: true
  validates :content, presence: true
end
