class ModifyUsers1 < ActiveRecord::Migration
  def change
    add_column :users, :hashed_password, :string
  end
end
