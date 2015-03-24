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

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer selected as best!"
      redirect_to question_path(@answer.question)
    else
      flash[:alert] = "Error. Answer not selected!"
      redirect_to :back
    end
    @answer.question.answers.each do |answer|
      if answer != @answer
        answer.update(best: false)
      end
    end
  end

private

  def set_false
    self.best = false
  end

  def answer_params
    params.require(:answer).permit(:content, :best)
  end
end
