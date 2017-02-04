class ModifyPictures1 < ActiveRecord::Migration
  def change
    add_reference :pictures, :entry, index: true
    add_column :pictures, :data,  :binary, limit: 20.megabytes
    add_column :pictures, :content_typet, :string
  end
end
