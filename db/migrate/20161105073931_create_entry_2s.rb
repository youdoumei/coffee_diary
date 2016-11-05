class CreateEntry2s < ActiveRecord::Migration
  def change
    create_table :entry_2s do |t|

      t.timestamps null: false
    end
  end
end
