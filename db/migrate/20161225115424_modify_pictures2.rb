class ModifyPictures2 < ActiveRecord::Migration
  def change
    add_column :pictures, :content_type, :string
  end
end
