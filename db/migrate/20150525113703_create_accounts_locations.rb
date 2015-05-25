class CreateAccountsLocations < ActiveRecord::Migration
  def change
    create_table :accounts_locations, :id => false do |t|
      t.integer :account_id
      t.integer :location_id
    end
  end
end
