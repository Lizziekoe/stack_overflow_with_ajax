class Answer < ActiveRecord::Base
  acts_as_votable
  belongs_to :question
  belongs_to :user

  validates :content, presence: true

  after_create :answer_mailer
  after_update :update_best

  private

  def update_best
    self.best == true
    self.question.answers.each do |answer|
      if answer != self
        answer.best == false
      end
    end
  end

  def answer_mailer
    AnswerMailer.answer_notification(self).deliver
  end
end
