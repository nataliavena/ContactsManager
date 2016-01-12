class User < ActiveRecord::Base
  has_secure_password

  has_many :contacts, class_name: 'Contact'
end
