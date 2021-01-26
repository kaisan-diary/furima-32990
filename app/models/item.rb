class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do 
    validates :image 
    validates :name
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "が設定範囲外です"}
  end  

  validates :price, numericality: { only_integer: true, message: "は半角数値で入力してください" }

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :shipping_burden_id
    validates :prefecture_id
    validates :shipping_date_id
  end  

end
