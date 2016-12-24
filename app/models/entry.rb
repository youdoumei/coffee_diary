class Entry < ActiveRecord::Base
  has_one :picture, class_name: "Picture", dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true
end
