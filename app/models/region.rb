class Region < ApplicationRecord
  has_ancestry

  has_many :shops
end