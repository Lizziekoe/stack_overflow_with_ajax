class MoveBestColumnToQuestionsClass < ActiveRecord::Migration
  def change
    add_column :questions, :best_answer_id, :integer
    remove_column :answers, :best 
  end
end
