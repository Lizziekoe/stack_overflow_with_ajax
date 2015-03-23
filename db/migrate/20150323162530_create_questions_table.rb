class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :title, :string
      t.column :content, :string

      t.timestamps
    end
  end
end
