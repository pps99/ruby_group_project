class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :user_details
  belongs_to :cake
end
