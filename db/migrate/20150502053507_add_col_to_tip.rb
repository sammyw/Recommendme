class AddColToTip < ActiveRecord::Migration
  def change
    add_column :tips, :state, :string
  end
end
