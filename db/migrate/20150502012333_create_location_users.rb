class CreateLocationUsers < ActiveRecord::Migration
  def change
    create_table :location_users do |t|
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
