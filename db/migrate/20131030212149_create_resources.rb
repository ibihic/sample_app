class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :resources, [:user_id, :created_at]
  end
end
