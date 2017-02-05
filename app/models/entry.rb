class Entry < ActiveRecord::Base
#  has_one :picture, class_name: "Picture", dependent: :destroy
  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

end
