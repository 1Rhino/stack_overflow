class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content

      t.timestamps null: false
      t.references :user, index: true
      t.references :question, index: true
      t.references :answer, index: true
    end
  end
end
