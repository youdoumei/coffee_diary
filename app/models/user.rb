class User < ActiveRecord::Base
  validates :password, presence: { on: :create },
   confirmation: { allow_blank: true }
  attr_accessor :password, :password_confirmation

  def create
  end

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def authenticate(name, password)
      user = find_by(name: name)
      if user && user.hashed_password.present? && BCrypt::Password.new(user.hashed_password) == password

        #trueかどうかを見ている,nillかfalse以外
        user
      else
        nil
      end
    end
  end
end
