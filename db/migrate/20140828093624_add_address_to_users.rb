class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :line1, :string
    add_column :users, :line2, :string
    add_column :users, :town, :string
    add_column :users, :county, :string
    add_column :users, :postcode, :string
  end
end
