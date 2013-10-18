class SaleOrder < ActiveRecord::Base
  belongs_to :customer
  has_many :sale_order_line_items
  attr_accessible :customer_po, :discount_percent, :posted,:notes

  def subtotal
    "TK"
  end

  def tax_amount
    "TK"
  end

  def total
    "TK"
  end

end
