class Title < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_many :editions

  def to_s
    self.name
  end
end
