class AddColsToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :start_date, :date
    add_column :plans, :end_date, :date
  end
end
