class UserDetail < ApplicationRecord
  has_many :cart_items
  belongs_to :user
  # mtzl
  #belongs_to :orders

  
  # mtzl

  has_many :orders, :dependent => :destroy

  

  validates :phone, presence: true
  validates :address, presence: true

  # mtzl
  #belongs_to :order_details
  #has_many :order_details, :dependent => :destroy
  # mtzl
end
