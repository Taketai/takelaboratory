class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string  :answer,                 null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
