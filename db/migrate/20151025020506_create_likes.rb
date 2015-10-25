class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.timestamps null: false
      t.references :user, index: true
      t.references :question, index: true
      t.references :answer, index: true
    end
  end
end
