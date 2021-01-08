class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_one_attached :image

  with_options presence: true do  
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_burden_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
    validates :image
  end  

end
