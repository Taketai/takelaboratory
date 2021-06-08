class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quizzes
  has_many :donations
  has_many :orders

  with_options presence: true do
    validates :nickname

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }

    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :last_name
      validates :first_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birth_day
  end

end
