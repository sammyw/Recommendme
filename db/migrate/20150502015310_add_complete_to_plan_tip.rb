class AddCompleteToPlanTip < ActiveRecord::Migration
  def change
    add_column :plan_tips, :complete, :boolean
  end
end
