class AnswerMailer < ApplicationMailer

  default from: "luke@luke.com"

  def answer_notification(answer)
    @answer = answer

    mail to: answer.question.user.username, subject: "Answer notification"
  end
end
