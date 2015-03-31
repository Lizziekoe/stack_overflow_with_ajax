class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @enjoyer = current_enjoyer
    @question = @enjoyer.questions.new(question_params)
    if @question.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Question successfully added."
          redirect_to questions_path
        end
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "There was a problem adding your question."
          redirect_to :back
        end
        format.js
      end
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Answer selected as best!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Error. Answer not selected!"
      redirect_to :back
    end
  end

  def destroy
    @question = Question.destroy(params[:id])
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :best_answer_id)
  end
end
