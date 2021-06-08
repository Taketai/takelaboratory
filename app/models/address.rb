class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order

  belongs_to_active_hash :shipping_area

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
  end
end