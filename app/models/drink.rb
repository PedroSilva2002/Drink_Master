class Drink < ApplicationRecord
  validates :price, :name, :volume, :barcode, presence: true
  validates :price, numericality: {greater_than: 0}

  has_many :reviews

end
