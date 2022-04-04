class Order < ApplicationRecord
  belongs_to :user
  belongs_to :user_details
  belongs_to :orders

  has_many :order_details, :dependent => :destroy
end
