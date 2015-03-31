class VotesController < ApplicationController
  def update
    @answer = Answer.find(params[:id])
    @answer.upvote_from current_enjoyer
    respond_to do |format|
      format.html do
        redirect_to question_path(@answer.question)
      end
      format.js
    end
  end
end
