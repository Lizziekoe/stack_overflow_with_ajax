class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully added."
      redirect_to questions_path
    else
      flash[:alert] = "There was a problem adding your photo."
      redirect_to :back
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
