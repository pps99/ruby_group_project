class Cart < ApplicationRecord
  has_many :cart_items
  has_many :cakes
  before_save :set_subtotal

  def subtotal
    
  end

  def total
    current_cart_item.total
  end

  private
  def set_total
    self[:total] = total
  end
  def set_subtotal
    self[:subtotal] = subtotal
  end
end
