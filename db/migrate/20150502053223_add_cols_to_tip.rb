class AddColsToTip < ActiveRecord::Migration
  def change
    add_column :tips, :country, :string
    add_column :tips, :city, :string
    add_column :tips, :region, :string
  end
end
