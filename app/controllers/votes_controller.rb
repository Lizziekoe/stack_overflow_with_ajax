class VotesController < ApplicationController
  def update
    @answer = Answer.find(params[:id])
    @answer.upvote_from current_user
    redirect_to question_path(@answer.question)
  end
end
