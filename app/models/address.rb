class Address < ApplicationRecord
  belongs_to :buy

  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  
end
