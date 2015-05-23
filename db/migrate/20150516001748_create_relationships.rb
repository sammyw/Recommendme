class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :friender_id
      t.integer :friendee_id
      t.boolean :approved

      t.timestamps null: false
    end
    add_index :relationships, :friender_id
    add_index :relationships, :friendee_id
    add_index :relationships, [:friender_id, :friendee_id], unique: true
  end
end
