class PurchaseOrder < ActiveRecord::Base
  validates :number, :uniqueness => true
  validates :number, :presence => true

  belongs_to :distributor

  has_many :purchase_order_line_items, dependent: :destroy

  def self.tags
    ['Normal','Frontlist','Course books','Event order','Tabling order','Special order','Used books','Remainders']
  end

  def estimated_total
    purchase_order_line_items.inject(Money.new(0)) {|sum,li| sum+li.ext_price   }
  end

  def estimated_total_string
    purchase_order_line_items.inject(Money.new(0)) {|sum,li| sum+li.ext_price   }.to_s
  end

  def number_of_copies
     purchase_order_line_items.inject(0) {|sum,li| sum+li.quantity}
  end

  def as_json(options = {})
    options[:methods] = :estimated_total_string
    super(options)
  end
end
