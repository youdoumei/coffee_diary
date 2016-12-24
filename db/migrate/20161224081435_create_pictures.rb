class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :entry, null: false
      t.binary :data
      t.string :content_type

      t.timestamps null: false
    end

    add_index :entry_pictures, :entry_id
  end
end
