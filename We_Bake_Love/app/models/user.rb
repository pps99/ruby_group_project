class User < ApplicationRecord
  has_secure_password
  has_many :cakes, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  validates :name, presence: true
  validates :email,presence: true, uniqueness: true , format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password,presence: true

end
