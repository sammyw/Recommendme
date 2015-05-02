class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :name
      t.string :tip_type
      t.text :description
      t.string :price
      t.string :initally_recommended_by
      t.string :best_for
      t.string :address
      t.string :suburb
      t.string :postcode
      t.string :website
      t.references :user, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
