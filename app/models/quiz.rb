class Quiz < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :answer, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  end


  def self.search(search)
    @quiz = Quiz.where(answer:'おににかなぼう').limit(3)
    
    # Quiz.all
  end

end
