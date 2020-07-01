class Product < ApplicationRecord
  validates :code,         presence: true, format: { with: /\A[a-zA-Z0-9]+\z/ }, uniqueness: true, length: { maximum: 8 }
  validates :name,         presence: true
  # validates :stock_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :price,        presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :image_url,    length: { minimum: 0 }
  validates :note,         length: { minimum: 0 }

  has_many :stocks, dependent: :destroy
  accepts_nested_attributes_for :stocks

end
