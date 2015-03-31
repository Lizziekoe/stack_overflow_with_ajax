class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @enjoyer = current_enjoyer
    @question = Question.find(params[:question_id])
    @answer = @enjoyer.answers.new(answer_params)
    @answer.question_id = @question.id
    if @answer.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Answer posted!"
          redirect_to question_path(@question)
        end
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "Error. Answer not posted!"
          redirect_to :back
        end
        format.js
      end
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer selected as best!"
      redirect_to question_path(@answer.question)
    else
      flash[:alert] = "Error. Answer not selected!"
      redirect_to :back
    end
  end

private

  def set_false
    self.best = false
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
