class Product < ApplicationRecord
    validates :code, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/ }, uniqueness: true, length: { maximum: 8 }
    validates :name, presence: true
    validates :stock_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :image_url, length: { minimum: 0 } 
    validates :note, length: { minimum: 0 } 
end


# 商品コード: 必須、英数字のみ、ユニーク、8文字いない
# 商品名: 必須
# 在庫数: 必須、0以上の数値の
# 商品画像: 任意
# メモ: 任意