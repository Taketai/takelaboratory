class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quizzes

  with_options presence: true do
    validates :answer, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  
  end
end
