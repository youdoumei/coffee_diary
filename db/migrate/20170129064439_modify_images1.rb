class ModifyImages1 < ActiveRecord::Migration
  def change
    add_reference :images, :entry, index: true
  end
end
