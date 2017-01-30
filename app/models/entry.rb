class Entry < ActiveRecord::Base
#  has_one :picture, class_name: "Picture", dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

end
