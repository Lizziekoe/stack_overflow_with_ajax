class ChangeUserIdColumn < ActiveRecord::Migration
  def change
    remove_column :questions, :user_id
    add_column :questions, :enjoyer_id, :integer

    remove_column :answers, :user_id
    add_column :answers, :enjoyer_id, :integer
  end
end
