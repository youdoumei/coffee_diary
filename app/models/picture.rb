class Picture < ActiveRecord::Base
  belongs_to :author, class_name: "Entry", foreign_key: "entry_id"
end
