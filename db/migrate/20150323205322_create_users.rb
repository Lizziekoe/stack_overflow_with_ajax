class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end

      add_column :questions, :user_id, :integer
      add_column :answers, :user_id, :integer
  end
end
