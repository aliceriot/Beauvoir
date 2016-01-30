class Edition < ApplicationRecord
  belongs_to :publisher
  belongs_to :title

end
