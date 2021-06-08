class Donation < ApplicationRecord

  belongs_to :user
  has_one :order

  has_one_attached :image


  with_options presence: true do
    validates :donation_name, :description, :image

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 999, less_than: 100001 } 
    end
  end
end
