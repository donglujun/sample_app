class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :level
      t.text :description
      t.integer :state
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
