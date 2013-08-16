class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :receiver_id
      t.references :user

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
