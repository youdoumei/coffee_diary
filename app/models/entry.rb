class Entry < ActiveRecord::Base
  has_many :pictures, dependent: :destroy
end
