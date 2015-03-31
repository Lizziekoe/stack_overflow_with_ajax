class AnswerMailer < ApplicationMailer

  default from: "luke@luke.com"

  def answer_notification(answer)
    @answer = answer

    mail to: answer.question.enjoyer.email, subject: "Answer notification"
  end
end
