class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, limit: 1000
      t.string :tags
      t.text :content

      t.references :user, index: true
      t.timestamps null: false
    end
    add_index :questions, :title
    add_index :questions, :tags
  end
end
