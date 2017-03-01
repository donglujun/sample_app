class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :info
      t.integer :infotatus
      t.integer :message_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
