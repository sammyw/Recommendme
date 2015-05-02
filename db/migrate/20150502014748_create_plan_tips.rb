class CreatePlanTips < ActiveRecord::Migration
  def change
    create_table :plan_tips do |t|
      t.references :tip, index: true, foreign_key: true
      t.references :plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
