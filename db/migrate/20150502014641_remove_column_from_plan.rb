class RemoveColumnFromPlan < ActiveRecord::Migration
  def change
    remove_reference :plans, :tip, index: true, foreign_key: true
  end
end
