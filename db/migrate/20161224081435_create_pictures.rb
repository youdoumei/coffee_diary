class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    #  t.references :entry, null: false
    #  t.binary :data, limit: 20.megabytes
    #  t.string :content_type

      t.timestamps null: false
    end
  #  add_index :entry_picture, :entry_id
  end
end
