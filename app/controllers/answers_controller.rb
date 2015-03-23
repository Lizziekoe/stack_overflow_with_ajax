class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = @user.answers.new(answer_params)
    @answer.question_id = @question.id
    if @answer.save
      flash[:notice] = "Answer posted!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Error. Answer not posted!"
      redirect_to :back
    end
  end

private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
