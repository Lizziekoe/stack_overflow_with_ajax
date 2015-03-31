class VotesController < ApplicationController
  def update
    @answer = Answer.find(params[:id])
    if params[:type] == "up"
      @answer.upvote_from current_enjoyer
    end
    if params[:type] == "down"
      @answer.downvote_from current_enjoyer
    end
    respond_to do |format|
      format.html do
        redirect_to question_path(@answer.question)
      end
      format.js
    end
  end
end
